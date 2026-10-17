# Proof Engineering Lab — Evidence Log

Status: **UNVALIDATED**

This directory is the working project for the companion Proof Engineering Book.

## Static Lake configuration audit — 2026-10-17

A repo-source static review found that `defaultTargets` named `proofengineeringlab` while the declared `[[lean_lib]]` target was `ProofEngineeringLab`. The target names were aligned in commit `5685f77f380ce6631c6c96440aa5a3cfa6da9618`. An executable lab README and Book Chapter 1–2 walkthroughs were added in subsequent commits. The current working runtime did **not** contain `lean`, `lake`, or `elan` on PATH. **No actual Lean build was run or observed; status remains UNVALIDATED**. This is a source-level fix, not a proof of successful compilation. Next required step: run the pinned project in a Lean-capable environment and preserve the command, toolchain, build log, exit status, and tested commit SHA.

## Current claim ceiling

The files have been written as a candidate minimal Lean project. No successful `lake build`, `#eval`, or kernel acceptance is claimed here yet.

A later run must execute the pinned toolchain/project and record:
- environment/toolchain actually used;
- working directory / project root;
- exact command (expected first check: `lake build`);
- exit status;
- relevant stdout/stderr;
- build target(s) actually processed;
- commit SHA tested.

Only after that observation may the Book describe the result as reproduced execution Evidence.


## Toolchain source check — 2026-09-29

The pinned candidate toolchain is `leanprover/lean4:v4.24.0`. Its release existence was checked against the Lean 4 upstream release surface before treating the version string as an installation candidate.

Execution state remains **UNVALIDATED**: the current execution surface used for this run does not provide `lean` / `lake`, so no build output, exit status, `#eval` result, or kernel-acceptance observation is recorded.

Proof Ceiling: source verification of a version identifier does not establish that this lab builds successfully.
