-------------------------- MODULE BankTransfer --------------------------
(***************************************************************************)
(* Two accounts, A and B, with 5 coins each. A transfer moves 1 to 5       *)
(* coins from one account to the other.                                    *)
(*                                                                         *)
(* THIS SPEC HAS A BUG — on purpose. Run TLC: one invariant survives,      *)
(* one doesn't. Your job: read the counterexample, find the bug, fix the   *)
(* spec so both invariants pass.                                           *)
(*                                                                         *)
(* Hint: compare what the actions check against what they change.         *)
(***************************************************************************)
EXTENDS Integers

VARIABLES balA, balB

Init == balA = 5 /\ balB = 5

TransferAtoB == \E amt \in 1..5 :
                  /\ amt <= balA
                  /\ balA' = balA - amt
                  /\ balB' = balB + amt


TransferBtoA == \E amt \in 1..5 :
                  /\ amt <= balB
                  /\ balB' = balB - amt
                  /\ balA' = balA + amt

Next == TransferAtoB \/ TransferBtoA

Spec == Init /\ [][Next]_<<balA, balB>>

\* No account may ever go below zero.
NoOverdraft == balA >= 0 /\ balB >= 0

\* Transfers move money; they never create or destroy it.
MoneyConstant == balA + balB = 10
=============================================================================
