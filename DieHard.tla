---------------------------- MODULE DieHard ----------------------------
(***************************************************************************)
(* The water-jug puzzle from the movie Die Hard 3, as a TLA+ spec.        *)
(* You have a 3-litre jug and a 5-litre jug. Get exactly 4 litres into     *)
(* the big jug.                                                            *)
(*                                                                         *)
(* The trick: the invariant NotSolved says "the big jug never holds 4".   *)
(* Run TLC and it FAILS — and the error trace it prints is the solution,   *)
(* step by step. Here, a counterexample is the answer.                     *)
(***************************************************************************)
EXTENDS Naturals

VARIABLES small, big

TypeOK == /\ small \in 0..3
          /\ big   \in 0..5

Init == /\ small = 0
        /\ big   = 0

FillSmall  == small' = 3 /\ big' = big
FillBig    == big' = 5 /\ small' = small
EmptySmall == small' = 0 /\ big' = big
EmptyBig   == big' = 0 /\ small' = small

Min(a, b) == IF a < b THEN a ELSE b

SmallToBig == /\ small' = small - Min(small, 5 - big)
              /\ big'   = big   + Min(small, 5 - big)

BigToSmall == /\ big'   = big   - Min(big, 3 - small)
              /\ small' = small + Min(big, 3 - small)

Next == FillSmall \/ FillBig \/ EmptySmall \/ EmptyBig
        \/ SmallToBig \/ BigToSmall

Spec == Init /\ [][Next]_<<small, big>>

NotSolved == big # 4
=============================================================================
