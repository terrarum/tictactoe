#Meteor.log.info "server/lobby"

Meteor.publish "games", ->
    Games.find()

gridModel = ->
    #Meteor.log.info "gridModel"
    return {
        id: uuid.v4()
        value: ''
        owner: ''
    }

grid = (count) ->
    gridArr = []
    #Meteor.log.info "count", count
    for i in [0...count] by 1
        row = []
        #Meteor.log.info "i", i
        for j in [0...count] by 1
            #Meteor.log.info "j", j
            row.push gridModel()
        gridArr.push row
    return gridArr

Meteor.methods
    # Add a game to the lobby.
    addGame: ->
        if !Meteor.userId()
            throw new Meteor.Error("not-authorized")

        Games.insert
            createdAt: new Date()
            ownerId: Meteor.userId()
            player1: Meteor.user().username
            player2: null
            active: false
            currentPlayer: Meteor.user().username
            grid: grid(3)

    # Delete a game from the lobby.
    deleteGame: (gameId) ->
        Games.remove gameId

    # Join a game.
    joinGame: (gameId) ->
        Games.update gameId,
            $set:
                player2: Meteor.user().username
                active: true