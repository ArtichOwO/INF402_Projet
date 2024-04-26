open INF402_Projet

let () =
  print_endline "お早うございます";
  Logic.print_cnf [ [ Var (1, 2, 3); Not (4, 5, 6) ]; [ Not (7, 4, 5) ] ];
  let board =
    Sudoku.board_of_string "SDK 4\n_ 2 _ 3\n_ _ 4 _\n1 _ _ _\n2 _ _ 2"
  in
  Sudoku.print_board board;
  Rules.R1.cnf_of_board board
  @ Rules.R2.cnf_of_board board
  @ Rules.R3.cnf_of_board board
  @ Rules.R4.cnf_of_board board
  @ Rules.R6.cnf_of_board board
  |> Logic.print_cnf
