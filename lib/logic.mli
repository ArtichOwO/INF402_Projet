type var =
	Var of int * int * int
	| Not of int * int * int

type clause = var list

type cnf = clause list

val print_cnf : cnf -> unit
