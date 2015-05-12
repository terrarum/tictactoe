# Tic Tac Toe

app-core is the main package.

Multiplayer Tic Tac Toe powered by Meteor.

Start meteor with local mongo:

```MONGO_URL="mongodb://localhost:27017/tictactoe" meteor```

# Things I Am Doing Wrong

- Using game IDs in the URL - should create a friendly URL of some kind.
- Game creator always goes first - should randomise.
- Cells need to know their X and Y position. Instead of this, there should be a 'get pos of cell with given id' function that returns an x/y object for reference to complement the 'get cell by pos' function.
- Really need tests for all of the grid functions.
- Using player names rather than player IDs to identify players in a game.

# Things I Could Do Better

- Store directions in pairs to get rid of that nasty getOppositeDirection switch?
- Some things are reacting to the results of a DB change (e.g. returning player to lobby if game is deleted) immediately, without time to present a message to the player.
- Game status needs to be stored as a boolean but this creates a nasty state object. Need helper methods for setting and getting the game state.


# Deploying to Dokku

I'm following this: http://blog.iansinnott.com/running-a-meteor-app-on-dokku/ but here's what I need for ease of access.

Add your Dokku server as a remote. This follows the following pattern:

    git remote add REMOTENAME DOKKUUSERNAME@YOURIPADDRESS.TLD:SUBDOMAINTOUSE

I'll be using
 
    git remote add dokku dokku@<ipaddress>:tictactoe
    
Make a .env file in the root dir (I've already done this but I'm noting it here anyway).
The .env file is used to tell Dokku which buildpack to use if you need one that isn't included as default.
Mine has:

    export BUILDPACK_URL='https://github.com/AdmitHub/meteor-buildpack-horse.git'
    
Next we need to install the Mongo plugin for Dokku. Shell into your server and enter the following:

    git clone https://github.com/jeffutter/dokku-mongodb-plugin.git /var/lib/dokku/plugins/mongodb
    dokku plugins-install
    
Now push your app to Dokku, like so:

    git push dokku master
    
It will fail, but now Dokku will be aware of your app.

On the server, enter

    dokku mongodb:start
    dokku mongodb:create tictactoe
    
The app now has a link to MongoDB.

Now we need to set the Root URL in the Dokku config, using the following format:

    dokku config:set <app> ROOT_URL=<url>
    
So I'll be using

    dokku config:set tictactoe ROOT_URL=http://jamesfidler.co.uk
    
We've given it the root address, but it will still go to http://tictactoe.jamesfidler.co.uk

Push the app to dokku again and it should work!