---------------------------- MODULE RiverCrossing ----------------------------
(*A farmer must ferry a wolf, a goat, and a cabbage across a river.         *
* The boat carries the farmer plus at most one passenger.                   *
* Left unsupervised, the wolf eats the goat and the goat eats the cabbage.  *)


VARIABLES farmer, wolf, goat, cabbage

Sides == {"left", "right"}

Init == farmer = "left" /\ wolf = "left" /\ goat = "left" /\ cabbage = "left"

Other(s) == IF s = "left" THEN "right" ELSE "left"

CrossWolf == /\ farmer = wolf 
             /\ farmer' = Other(farmer)
             /\ wolf' = Other(wolf)
             /\ goat' = goat
             /\ cabbage' = cabbage
             /\ (goat' /= cabbage' \/ goat' = farmer')
             /\ (wolf' /= goat' \/ wolf' = farmer')

CrossGoat == /\ farmer = goat
             /\ farmer' = Other(farmer)
             /\ goat' = Other(goat)
             /\ wolf' = wolf
             /\ cabbage' = cabbage
             /\ (goat' /= cabbage' \/ goat' = farmer')
             /\ (wolf' /= goat' \/ wolf' = farmer')

CrossCabbage == /\ farmer = cabbage
                /\ farmer' = Other(farmer)
                /\ cabbage' = Other(cabbage)
                /\ wolf' = wolf
                /\ goat' = goat
                /\ (goat' /= cabbage' \/ goat' = farmer')
                /\ (wolf' /= goat' \/ wolf' = farmer')
            
GoBack == /\ farmer' = Other(farmer)
          /\ wolf' = wolf
          /\ goat' = goat
          /\ cabbage' = cabbage
          /\ (goat' /= cabbage' \/ goat' = farmer')
          /\ (wolf' /= goat' \/ wolf' = farmer')

Safe == (farmer /= goat => wolf /= goat)
     /\ (farmer /= cabbage => goat /= cabbage)

Next == CrossWolf \/ CrossGoat \/ CrossCabbage \/ GoBack

Spec == Init /\ [][Next]_<<farmer, wolf,goat,cabbage>>

NotSolved == ~ (farmer = "right" /\ wolf = "right" /\ goat = "right" /\ cabbage = "right")

====
