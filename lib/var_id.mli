type id = int
type ids = Logic.x_lcv list

val ids : Logic.cnf -> ids
val id_of_var : Logic.x_lcv -> ids -> id option
val print_ids : ids -> unit
