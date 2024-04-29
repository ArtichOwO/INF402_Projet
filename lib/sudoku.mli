type cell = Cell of int | Empty
type board = int * cell list

(* Parser une grille de sudoku. *)
val board_of_string : string -> board
(* Imprimer une grille dans la console. *)
val print_board : board -> unit
