type id = int
type ids = Logic.x_lcv list

(* Générer les identifiants des variables. *)
val ids : Logic.cnf -> ids
(* Obtenir l'identifiant d'une variable. *)
val id_of_var : Logic.x_lcv -> ids -> id option
(* Imprimer tout les identiants dans la console. *)
val print_ids : ids -> unit
