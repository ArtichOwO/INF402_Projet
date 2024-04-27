open INF402_Projet

let () =
  if Array.length Sys.argv <> 2 then
    Printf.sprintf "usage: %s <file>" @@ Array.get Sys.argv 0 |> failwith;
  let ch = Array.get Sys.argv 1 |> open_in_bin in
  let s = in_channel_length ch |> really_input_string ch in
  close_in ch;
  let board = Sudoku.board_of_string s in
  Rules.R1.cnf_of_board board
  @ Rules.R2.cnf_of_board board
  @ Rules.R3.cnf_of_board board
  @ Rules.R4.cnf_of_board board
  @ Rules.R6.cnf_of_board board
  |> DIMACS.dimacs_of_cnf |> DIMACS.string_of_dimacs |> print_endline
