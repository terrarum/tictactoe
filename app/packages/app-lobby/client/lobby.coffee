Games = new Mongo.Collection "games"
Meteor.subscribe 'games'

Template.lobby.events
    'click .js-new-game': ->
        createGame()

Template.gameItem.events
    'click .js-delete': ->
        deleteGame @

    'click .js-join': ->
        joinGame @

createGame = ->
    Meteor.call 'addGame'

deleteGame = (game) ->
    Meteor.call 'deleteGame', game._id

joinGame = (game) ->
    Meteor.call 'joinGame', game._id

Template.gamesList.helpers
    gamesList: ->
        return Games.find()

Template.gameItem.helpers
    # Returns whether or not the current user is the
    # owner of the game.
    owner: ->
        return Meteor.userId() == this.ownerId
    # Returns whether or not the game has a second player.
    open: ->
        console.log this.player2?
        return !this.player2?