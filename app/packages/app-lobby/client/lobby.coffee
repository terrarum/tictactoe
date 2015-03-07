Meteor.log.info "client/lobby"

Meteor.subscribe 'games'

Template.lobby.events
    'click .js-new-game': ->
        createGame()

Template.gameItem.events
    'click .js-delete': ->
        deleteGame @

    'click .js-join': ->
        joinGame @

    'click .js-resume': ->
        Router.go '/game/' + this._id

createGame = ->
    Meteor.call 'addGame'

deleteGame = (game) ->
    Meteor.call 'deleteGame', game._id

joinGame = (game) ->
    Meteor.call 'joinGame', game._id
    Router.go '/game/' + game._id

# Returns all open games.
Template.gamesList.helpers
    gamesList: ->
        return Games.find
            active: false

# Returns any games that you are a player of that are not open.
Template.yourGamesList.helpers
    gamesList: ->
        return Games.find
            active: true
            $or: [
                    player1: Meteor.user().username
                ,
                    player2: Meteor.user().username
            ]

Template.gameItem.helpers
    # Returns whether or not the current user is the
    # owner of the game.
    owner: ->
        return Meteor.userId() == this.ownerId
    active: ->
        return this.player2?
