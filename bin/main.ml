open INF402_Projet

let () = 
	print_endline "お早うございます";
	Logic.print_cnf [ [ Var (1, 2, 3); Not (4, 5, 6) ]; [ Not (7, 4, 5) ] ];
	Sudoku.board_of_string 
	"SDK 4
	 _ 2 _ 3
	 _ _ 4 _
	 1 _ _ _
	 2 _ _ 2"
	|> Sudoku.print_board

