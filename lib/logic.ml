type x_lcv = int * int * int

type var =
	Var of x_lcv
	| Not of x_lcv

type clause = var list

type cnf = clause list

let print_cnf = 
	(fun ci c ->
		if ci <> 0 then
			print_string "∧ ";
		print_string "(";
		List.iteri (fun vi v ->
			if vi <> 0 then
				print_string " ∨ ";
			match v with
			| Var (line, col, value) -> 
				Printf.printf "[%i,%i,%i]" line col value
			| Not (line, col, value) -> 
				Printf.printf "¬[%i,%i,%i]" line col value
		) c;
		print_endline ")"
	) |> List.iteri
