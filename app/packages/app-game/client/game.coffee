Meteor.log.info "game"

gridLine = (line) ->
    lineHtml = ''
    for cell in line
        lineHtml += '<td>' + cell + '</td>'
    return lineHtml

Template.renderGrid.helpers
    grid: ->
        console.log "grid", @.grid
        return @.grid