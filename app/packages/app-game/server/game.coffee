# Return a reference to a cell by its ID.
getCellById = (cellId, grid) ->
    for i in [0...grid.length] by 1
        for j in [0...grid[i].length] by 1
            if grid[i][j].id is cellId
                return grid[i][j]

Meteor.methods
    updateGrid: (cellId, game) =>
        return if game.currentPlayer != Meteor.user().username
        cell = getCellById cellId, game.grid
        return if cell.value != ""

        currentPlayer = null

        # Set the cell value and owner.
        if (game.currentPlayer == game.player1)
            cell.value = "X"
            cell.owner = game.player1

            # Update current player.
            currentPlayer = game.player2
        else
            cell.value = "O"
            cell.owner = game.player2

            # Update current player.
            currentPlayer = game.player1

        # Now that the grid has been updated,
        # see if there is a winner.
        console.log "----- Checking Win State -----"
        won = @.checkWon cell, game.grid
        console.log "Win State:", won

        # Update board.
        Games.update game._id,
            $set:
                grid: game.grid
                currentPlayer: currentPlayer

        # Update players.
        if !won
            # Update current player.
            if (game.currentPlayer == game.player1)
                currentPlayer = game.player2
            else
                currentPlayer = game.player1
        return won