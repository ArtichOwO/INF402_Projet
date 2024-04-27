module type Rule = sig
  val cnf_of_board : Sudoku.board -> Logic.cnf
end

module R1 : Rule (* Toutes les cases ont au moins une valeur *)
module R2 : Rule (* Toutes les cases ont au plus une valeur *)
module R3 : Rule (* Chaque ligne possède toutes les valeurs de 1 à n *)
module R4 : Rule (* Chaque colonne possède toutes les valeurs de 1 à n *)
module R5 : Rule (* Chaque bloc possède toutes les valeurs de 1 à n *)
module R6 : Rule (* Cases déjà remplies *)
