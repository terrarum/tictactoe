#Meteor.log.info "server/game"

Meteor.methods
    updateGrid: (game) ->

        newCP = null

        if (game.currentPlayer == game.player1)
            newCP = game.player2
        else
            newCP = game.player1

        Games.update game._id,
            $set:
                grid: game.grid
                currentPlayer: newCP