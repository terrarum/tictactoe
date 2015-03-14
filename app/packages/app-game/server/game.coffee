Meteor.log.info "server/game"

Meteor.methods
    updateGrid: (game) ->
        Games.update game._id,
            $set:
                grid: game.grid