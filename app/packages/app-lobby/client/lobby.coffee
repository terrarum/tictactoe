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
        return Games.find
            active: false

Template.yourGamesList.helpers
    gamesList: ->
        return Games.find
            active: true

Template.gameItem.helpers
    # Returns whether or not the current user is the
    # owner of the game.
    owner: ->
        return Meteor.userId() == this.ownerId
    active: ->
        return this.player2?