#Meteor.log.info "game"

Meteor.subscribe 'games'

game = null

Template.renderGrid.helpers
    grid: ->
        game = @
        return @.grid

Template.gridCell.events
    'click .js-grid-cell': ->
        if (game.currentPlayer == Meteor.user().username)
            @.value = "X"
            Meteor.call 'updateGrid', game
