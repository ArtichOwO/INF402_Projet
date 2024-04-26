module type Rule = sig
  val cnf_of_board : Sudoku.board -> Logic.cnf
end

module R1 : Rule (* 各マスには少なくとも1つの値がある *)
module R2 : Rule (* 各マスには最大一つの値がある *)
module R3 : Rule (* 各行には1からnまで全ての数字がある *)
module R4 : Rule (* 各列には1からnまで全ての数字がある *)
module R5 : Rule (* 各ブロックには1からnまで全ての数字がある *)
module R6 : Rule (* 全てのマスに記入済み *)
