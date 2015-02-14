Games = new Mongo.Collection "games"

Meteor.publish "games", ->
    Games.find()

Meteor.methods

    # Add a game to the lobby.
    addGame: ->
        if ! Meteor.userId()
            throw new Meteor.Error("not-authorized")

        Games.insert
            createdAt: new Date()
            player1: Meteor.user().username
            player2: null

    # Delete a game from the lobby.
    deleteGame: (gameId) ->
        Games.remove gameId