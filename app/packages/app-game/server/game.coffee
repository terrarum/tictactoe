#Meteor.log.info "server/game"

getCell = (cellId, grid) ->
    for i in [0...grid.length] by 1
        for j in [0...grid[i].length] by 1
            if grid[i][j].id is cellId
                return grid[i][j]

Meteor.methods
    updateGrid: (cellId, game) ->
        return if game.currentPlayer != Meteor.user().username
        cell = getCell cellId, game.grid
        return if cell.value != ""

        currentPlayer = null


        if (game.currentPlayer == game.player1)
            currentPlayer = game.player2
            cell.value = "X"
            cell.owner = game.player1
        else
            currentPlayer = game.player1
            cell.value = "O"
            cell.owner = game.player2

        Games.update game._id,
            $set:
                grid: game.grid
                currentPlayer: currentPlayer