#Meteor.log.info "game"

Meteor.subscribe 'games'

game = null

Template.renderGrid.helpers
    grid: ->
        game = @
        return @.grid

Template.gridCell.events
    'click .js-grid-cell': ->
        return if game.currentPlayer != Meteor.user().username
        return if @.value != ""
        Meteor.call 'updateGrid', @.id, game
