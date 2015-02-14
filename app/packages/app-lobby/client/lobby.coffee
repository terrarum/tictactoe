Games = new Mongo.Collection "games"
Meteor.subscribe 'games'

Template.lobby.events
    'click .js-new-game': ->
        createGame()

createGame = ->
    Meteor.call 'addGame'

deleteGame = ->
    Meteor.call 'deleteGame', @._id

Template.gamesList.helpers
    gamesList: ->
        return Games.find()