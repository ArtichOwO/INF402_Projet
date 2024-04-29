type x_lcv = int * int * int
type var = Var of x_lcv | Not of x_lcv
type clause = var list
type cnf = clause list

(* Imprimer la FNC dans la console. *)
val print_cnf : cnf -> unit
