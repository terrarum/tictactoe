WIN_LENGTH = 3
NW = 0
N = 1
NE = 2
E = 3
SE = 4
S = 5
SW = 6
W = 7

chainLength = 0
baseDirs = [
    W,
    NW,
    N,
    NE
]
baseCell = null

# Check whether or not the game has been won.
@.checkWon = (cell, grid) ->
    baseCell = cell

    won = null

    for dir in baseDirs
        return if isWon()
        # Set chain to 1 because a token has been placed.
        chainLength = 1
        won = checkDirection baseCell, grid, dir
        if !won
            # Check the opposite direction.
            won = checkDirection baseCell, grid, getOppositeDirection(dir)
    console.log "won:", won
    return won

# Has the game been won yet?
isWon = ->
    return chainLength == WIN_LENGTH;

checkDirection = (cell, grid, dir) ->
    # Get a cell in a direction.
    nextCell = getCellInDir(grid, cell, dir)

    # If the new cell is valid and has the same value as the baseCell.
    if isCellValid(nextCell, baseCell.value)

        # Increase chain length.
        chainLength++
        console.log "Chain Length", chainLength, isWon()
        if isWon()
            return true
        else
            # Check the next cell.
            checkDirection nextCell, grid, dir
    return false

# Returns the opposite direction to the one given.
getOppositeDirection = (dir) ->
    oppositeDir = null
    switch dir
        when N
            oppositeDir = S
        when NE
            oppositeDir = SW
        when E
            oppositeDir = W
        when SE
            oppositeDir = NW
        when S
            oppositeDir = N
        when SW
            oppositeDir = NE
        when W
            oppositeDir = E
        when NW
            oppositeDir = SE
        else
            console.log 'You did not supply a valid direction, so you will get null.'
    return oppositeDir

# Gets the next cell in the given direction.
getCellInDir = (grid, cell, dir) ->
    newCell = null
    switch dir
        when NW
            newCell = getCellByPos(grid, cell.x - 1, cell.y - 1)
        when N
            newCell = getCellByPos(grid, cell.x, cell.y - 1)
        when NE
            newCell = getCellByPos(grid, cell.x + 1, cell.y - 1)
        when E
            newCell = getCellByPos(grid, cell.x + 1, cell.y)
        when SE
            newCell = getCellByPos(grid, cell.x + 1, cell.y + 1)
        when S
            newCell = getCellByPos(grid, cell.x, cell.y + 1)
        when SW
            newCell = getCellByPos(grid, cell.x - 1, cell.y + 1)
        when W
            newCell = getCellByPos(grid, cell.x - 1, cell.y)
        else
            newCell = null
    return newCell

# Get a cell in the grid by its position.
getCellByPos = (grid, x, y) ->
    if grid[y] != undefined
        grid[y][x]
    else
        undefined

# Is the cell valid?
isCellValid = (cell, value) ->
    if cell == undefined
        false
    else if cell.value != value
        false
    else
        true