open Logic

type id = int
type ids = x_lcv list

let ids f =
  let rec add_id vars l =
    match l with
    | Var c :: tl | Not c :: tl ->
        if List.mem c vars then add_id vars tl else add_id (c :: vars) tl
    | _ -> vars
  in
  (0, 0, 0) :: add_id [] (List.flatten f)

let id_of_var v = List.find_index @@ fun c -> c = v

let print_ids =
  List.iteri (fun idx (l, c, v) -> Printf.printf "(%i,%i,%i)->%i\n" l c v idx)
