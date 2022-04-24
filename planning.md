Board.new
@board.setup -> initialize board's properties
@board.get("A1") -> get the piece object at the location

@board.set("A2", Pawn.new("white)) -> set the cell at the given location, the given piece object
@board.delete("A2) -> delete the piece object at the given location if exist

cell.row
cell.column
Cell.from_notation('A3')


# game init
2 players: one controls black pieces and one controls white pieces
board with black pieces and white pieces  at initial postions

# game start
player: white play first
player give start position and end position
## evaluation
start position and end position are legal?
start position has player's pieces?
that piece can move from start position to end position?
## end evaluation
if evaluation is true -> continue
if evaluation is false -> redo input step

go to checking phase
# checkking phase

# end checking phase
if checking, mark the opposite player as being checked

go to end game phase
# end game phase

# end end game phase

switch player

if player is being checked

go to check mate phase

# check mate phase

# end check mate phase
if player is checked-mate then end game


# end check mate phase


