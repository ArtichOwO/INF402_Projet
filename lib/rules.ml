open Logic
open Sudoku

module type Rule = sig
  val cnf_of_board : board -> cnf
end

module R1 : Rule = struct
  let cnf_of_board (n, _) =
    List.init (n * n) (fun idx_lc ->
        List.init n (fun idx_v ->
            Var ((idx_lc / n) + 1, (idx_lc mod n) + 1, idx_v + 1)))
end

module R2 : Rule = struct
  let cnf_of_board (n, _) =
    List.init (n * n) (fun idx_lc ->
        List.init (n - 1) (fun idx_v ->
            List.init
              (n - 1 - idx_v)
              (fun idx_vp ->
                [
                  Not ((idx_lc / n) + 1, (idx_lc mod n) + 1, idx_v + 1);
                  Not ((idx_lc / n) + 1, (idx_lc mod n) + 1, idx_v + idx_vp + 2);
                ]))
        |> List.flatten)
    |> List.flatten
end

module R3 : Rule = struct
  let cnf_of_board (n, _) =
    List.init (n * n) (fun idx_lv ->
        List.init n (fun idx_c -> Var (idx_lv / n, idx_c + 1, idx_lv mod n)))
end

module R4 : Rule = struct
  let cnf_of_board (n, _) =
    List.init (n * n) (fun idx_cv ->
        List.init n (fun idx_l -> Var (idx_l + 1, idx_cv / n, idx_cv mod n)))
end

module R5 : Rule = struct
  let cnf_of_board (n, _) =
    let sqrt_n = float_of_int n |> sqrt |> int_of_float in
    List.init n (fun idx_v ->
        Printf.printf "--- V=%i --------\n" idx_v;
        List.init n (fun idx_b ->
            List.init n (fun idx_ij ->
                Var
                  ( (idx_b / sqrt_n * sqrt_n) + (idx_ij / sqrt_n) + 1,
                    (idx_b mod sqrt_n * sqrt_n) + (idx_ij mod sqrt_n) + 1,
                    idx_v + 1 ))))
    |> List.flatten
end

module R6 : Rule = struct
  let cnf_of_board (n, b) =
    List.mapi
      (fun idx el ->
        match el with
        | Cell i -> Some [ Var ((idx / n) + 1, (idx mod n) + 1, i) ]
        | Empty -> None)
      b
    |> List.filter Option.is_some |> List.filter_map Fun.id
end
