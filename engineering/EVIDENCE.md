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

## 2026-10-18 — move to shared public repository (static readback; not a build)

- Canonical project path: `YutoriKomeiji/lean4-learning-lab/engineering/`.
- Migrated from the separate private Zenn authoring copy without deleting the original.
- Public readback observed the five files: `ProofEngineeringLab.lean`, `lakefile.toml`, `lean-toolchain`, `README.md`, `EVIDENCE.md`.
- `lakefile.toml` declares `defaultTargets = ["ProofEngineeringLab"]` and `[[lean_lib]] name = "ProofEngineeringLab"`; source file uses the matching basename.
- `lean-toolchain` currently specifies `leanprover/lean4:v4.24.0`. The historical proof-literacy project at repository root separately uses `v4.33.1`.
- A dedicated GitHub Actions workflow `.github/workflows/engineering-build.yml` was added with `engineering/**` path filters. Its run list, terminal job result and logs could not be retrieved from the available connector; an empty combined commit-status array is **not** evidence of success or failure.
- The authoring runtime did not contain `lean`, `lake` or `elan` executables; no local `lake build` was executed.
- **Decision:** retain `UNVALIDATED` until a real terminal result bound to a commit and recorded logs is reviewed.

When new execution evidence is available, append it under a fresh timestamp rather than rewriting the history above.
