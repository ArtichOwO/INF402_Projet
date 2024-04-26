type cell = Cell of int | Empty
type board = int * cell list

let board_of_string s =
  let lexer = Genlex.make_lexer [ "SDK"; "_" ] @@ Stream.of_string s in
  let _ = Stream.next lexer in
  (* SDK *)
  let n = match Stream.next lexer with Int i -> i | _ -> failwith "nがない" in
  ( n,
    List.init (n * n) @@ fun idx ->
    match Stream.next lexer with
    | Kwd "_" -> Empty
    | Int i -> Cell i
    | _ -> Printf.sprintf "間違ったトークン (%i)" idx |> failwith )

let print_board (n, b) =
  List.iteri
    (fun idx el ->
      if idx <> 0 && idx mod n = 0 then print_char '\n';
      match el with Cell i -> print_int i | Empty -> print_char '_')
    b;
  print_char '\n'
