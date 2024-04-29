(lang dune 3.9)

(name INF402_Projet)

(generate_opam_files true)

(source
 (github ArtichOwO/INF402_Projet))

(authors "Hugo EXERTIER"
         "Maxime FAURE-BONACCORSI" 
         "Raed BEN CHEIKH" 
         "Léo GRANGE")

(maintainers "Hugo EXERTIER"
             "Maxime FAURE-BONACCORSI" 
             "Raed BEN CHEIKH" 
             "Léo GRANGE")

(package
 (name INF402_Projet)
 (synopsis "Projet INF402")
 (description "Génération de fichier DIMACS à partir d'une grille de sudoku.")
 (depends ocaml dune camlp-streams))
