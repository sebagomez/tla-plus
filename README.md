# TLA+ lab pack

Four tiny specifications you run, break, and fix. Everything here was executed with TLC before shipping — the expected results in the Academy page are the real outputs.

## What's inside

| File | What it is |
|---|---|
| `HourClock.tla` / `.cfg` | Lamport's first spec: an hour-only clock. Run it, then break it. |
| `DieHard.tla` / `.cfg` | The Die Hard 3 water-jug puzzle. TLC's "error" trace is the solution. |
| `BankTransfer.tla` / `.cfg` | Two accounts, one deliberate bug. Find it from the counterexample, fix it, make it pass. |
| `RiverCrossing.tla` / `.cfg` | The farmer, the wolf, the goat, and the cabbage — the first spec written from scratch. Every crossing is fenced so an unsafe landing can't happen; TLC's violation of `NotSolved` is the 7-crossing plan, and `Safe` never fires. |
| `tla2tools.jar` | The TLA+ tools (parser + TLC model checker), v1.8.0. |

## Run (command line)

Needs a Java runtime, version 11 or newer (`java -version` to check).

```
java -cp tla2tools.jar tlc2.TLC -workers auto HourClock
java -cp tla2tools.jar tlc2.TLC -workers auto DieHard
java -cp tla2tools.jar tlc2.TLC -workers auto BankTransfer
java -cp tla2tools.jar tlc2.TLC -workers auto RiverCrossing
```

TLC picks up the `.cfg` file with the same name as the spec automatically.

## Run (VS Code)

Install the extension once: `code --install-extension tlaplus.vscode-ide`

Open a `.tla` file, then run the command **TLA+: Check model with TLC** from the command palette.
