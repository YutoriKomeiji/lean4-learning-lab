# Agent instructions for Lean 4 Learning Lab

This repository is a public companion to two Zenn Lean 4 Books, with an independently preserved historical proof-literacy experiment at the root and a technical practice Lake project in `engineering/`.

## Two independent project roots

- `./` is the **historical frozen experiment** (Lean `v4.33.1`, `lakefile.lean`, `Lean4ProofLiteracyLab.lean`). Do not move or rewrite its frozen formal inputs, fixtures, or original audit/evidence paths merely to reorganize this repository.
- `engineering/` is the **hands-on Book project** (Lean `v4.24.0`, `lakefile.toml`, `ProofEngineeringLab.lean`). Use `cd engineering && lake build` for its verification; `lake build` at repository root does not verify engineering.
- Consult `MIGRATION.md` before treating historical AI-evaluator observations as applying to the renamed repository/rewritten README.
- Source Zenn Book manuscripts remain in `YutoriKomeiji/zenn-content`; keep the technical Book `published: false` until separately authorized.
- No claim of a successful engineering build without the actual command, environment, commit, logs, exit status and terminal CI/job outcome.

## Read first

1. `README.md`
2. `lean-toolchain`
3. the exact theorem, example, article-support artifact, or workflow affected by the task

Preserve the distinction among compiled Lean statements, mathematical interpretation, explanatory prose, and broader claims. A successful `lake build` proves only that the checked Lean project compiles under its pinned toolchain.

## GitHub Actions preflight

Before making a change that may trigger GitHub Actions:

1. Identify the workflows triggered by the target paths and event.
2. Inspect the relevant workflow definitions before changing files. If the workflow has not run recently, especially after several days, also inspect its latest runs and recent failure history before triggering it again.
3. Check referenced action/runtime versions, pinned Lean/elan assumptions, dependency-install behavior, runner assumptions, and obvious deprecation or staleness risks.
4. Check publication, branch, path-filter, freeze/candidate, and other repository-specific gates before changing a governed path.
5. Keep mutually dependent Lean source, examples, article-support material, tests, generated evidence, or fixtures atomic where practical.
6. After the change, read back every workflow triggered by that change to a terminal state. Do not report the change as green while relevant runs are queued or in progress.
7. Treat historical failed runs as retained evidence. Do not rerun, erase, or cosmetically replace them only to make the Actions UI green.

A passing workflow proves only the scope asserted by that workflow. It does not establish mathematical significance, external correctness, publication authority, or claims beyond the encoded statements.

## Human Gate

Do not publish externally, strengthen proof/result claims, change visibility/permissions/credentials, or perform destructive/irreversible operations without the applicable explicit approval.
