type d_var = int
type d_clause = d_var list
type dimacs = { v_nb : int; c_nv : int; clauses : d_clause list }

let dimacs_of_cnf cnf =
  let ids = Var_id.ids cnf in
  {
    v_nb = List.length ids;
    c_nv = List.length cnf;
    clauses =
      List.map
        (List.map (function
          | Logic.Var c -> Var_id.id_of_var c ids |> Option.get
          | Logic.Not c -> -(Var_id.id_of_var c ids |> Option.get)))
        cnf;
  }

let string_of_dimacs { v_nb; c_nv; clauses } =
  Printf.sprintf "p cnf %i %i\n" v_nb c_nv
  :: List.map
       (fun el -> List.map string_of_int el @ [ "\n" ] |> String.concat " ")
       clauses
  |> String.concat ""
