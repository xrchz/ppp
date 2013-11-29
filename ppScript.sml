open HolKernel boolLib bossLib lcsymtacs semanticsTheory probabilityTheory
val _ = new_theory"pp"

val _ = type_abbrev ("observation", ``:num``)

val _ = type_abbrev ("action", ``:external_action # exp``)
val _ = type_abbrev ("searcher", ``:observation -> (action # thm) option``)
val _ = type_abbrev ("policy", ``:observation -> action``)
(*
val _ = type_abbrev ("world", ``:observation -> action -> real``)
val _ = type_abbrev ("goal", ``:observation -> real``)
*)

(* non-tiling *)
val ntgood_def = Define`
  ntgood w g (Sequent([],tm)) a o =
    let gtm = (* (Comb (Comb (Const ">=" (Fun (Tyapp "real" []) (Tyapp "real" []))) ...) ...) *) (* want (quotation of): (w o a >= g o) *) in
      ACONV gtm tm`

(*
val good_def = Define`
  
`
*)

val pi_def = Define`
  pi (world:hol_term) (goal:hol_term) (searcher:searcher) (default:policy) (o:observation) =
    case searcher o of
    | SOME (a,th) =>
        if good world goal th a o then a else default o
    | NONE => default o`

val _ = export_theory()
