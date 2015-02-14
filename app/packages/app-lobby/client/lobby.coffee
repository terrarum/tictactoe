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
    owner: ->
        return Meteor.userId() == this.ownerId