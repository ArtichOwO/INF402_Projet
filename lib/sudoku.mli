type cell = Cell of int | Empty
type board = int * cell list

val board_of_string : string -> board
val print_board : board -> unit
