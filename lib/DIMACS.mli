type d_var = int
type d_clause = d_var list
type dimacs = { v_nb : int; c_nv : int; clauses : d_clause list }

val dimacs_of_cnf : Logic.cnf -> dimacs
val string_of_dimacs : dimacs -> string
