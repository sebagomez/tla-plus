--------------------------- MODULE HourClock ---------------------------
(***************************************************************************)
(* The classic first TLA+ spec (from Leslie Lamport's "Specifying         *)
(* Systems"): a clock that only shows the hour, ticking 1, 2, ... 12, 1... *)
(***************************************************************************)
EXTENDS Naturals

VARIABLE hr

TypeOK == hr \in 1..12

HCini == hr \in 1..12

HCnxt == hr' = IF hr # 12 THEN hr + 1 ELSE 1

Spec == HCini /\ [][HCnxt]_hr
=============================================================================
