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