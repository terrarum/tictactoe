#Meteor.log.info "game"

Meteor.subscribe 'games'

game = null

Template.renderGrid.helpers
    grid: ->
        game = @
        return @.grid

Template.gridCell.events
    'click .js-grid-cell': ->
        @.value = "X"
        Meteor.call 'updateGrid', game