# Proof Engineering Lab — Evidence Log

## 2026-10-20 — verified chapter and bonus checks (latest observed CI)

- Run: https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278
- Job ID: `118658580934`; `engineering-lake-build` completed successfully; raw job logs inspected.
- Checked-out source commit: `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8`.
- Runner: GitHub-hosted Ubuntu 24.04.5 LTS. Toolchain: `leanprover/lean4:v4.24.0`; Lake 5.0.0-src+797c613.
- Working directory: `engineering/`. Commands: `lake build`; `bash scripts/verify-teaching-examples.sh`.
- Observed baseline: `Built ProofEngineeringLab` and `Build completed successfully (3 jobs)`.
- Observed independent source checks: `TYPECHECK_PASS` for chapters 02, 03, 06, 16, 17, 18 Before, 18 AfterRepaired; bonus AccessControl, TwoPersonGate, VersionBoundApproval.
- Observed chapter 07 isolated module/import variant: `Built ProofEngineeringLab.Basic`, `Build completed successfully (4 jobs)`, then `SPLIT_VARIANT_PASS`.
- Observed negative test (chapter 18): intentionally contradictory theorem rejected with `error: unsolved goals`, `⊢ False`; script reported `EXPECTED_FAILURE_OBSERVED`.
- Final script line: `TEACHING_EXAMPLES: SUCCESS (positive checks passed; intended failure rejected)`. CI step and job both concluded `success`. Shell used `bash -e`; raw log did not print a numeric exit code.
- Proof ceiling: success is limited to the listed files/cases and their tested SHA. It does NOT establish comprehensive Book prose accuracy, OS-by-OS installation success, all chapter exercises/solutions, semantic correspondence of the specification to a real system, or third-party reproduction.
- Independent third-party reproduction: NOT PERFORMED (optional).

**Current summary (updated 2026-10-20):**
- **Baseline lab CI build: VERIFIED for commit `f445a1ee5efb33f1c88d316158b6c5586f11ff0f`** via [run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427); raw job output recorded below.
- **Later chapter-specific snippets and bonus files: VERIFIED ONLY FOR THE FILES LISTED IN THE NEW 2026-10-20 RUN ABOVE; the historical baseline CI did not cover them.**
- **Chapter 18 intentional failure and repaired source: VERIFIED in the new run above, not in the historical baseline.**
- **Independent third-party reproduction: NOT PERFORMED (optional, not a publication prerequisite).**
- **Current main as a whole: not claimed to be covered by the historical baseline run.**

This directory is the working project for the companion Proof Engineering Book. Earlier entries below are preserved as historical snapshots. In particular, `UNVALIDATED` statements dated before the baseline CI run describe the state **at that time**, not the current baseline verdict.

## Static Lake configuration audit — 2026-10-17

A repo-source static review found that `defaultTargets` named `proofengineeringlab` while the declared `[[lean_lib]]` target was `ProofEngineeringLab`. The target names were aligned in commit `5685f77f380ce6631c6c96440aa5a3cfa6da9618`. An executable lab README and Book Chapter 1–2 walkthroughs were added in subsequent commits. The current working runtime did **not** contain `lean`, `lake`, or `elan` on PATH. **No actual Lean build was run or observed; status remains UNVALIDATED**. This is a source-level fix, not a proof of successful compilation. Next required step: run the pinned project in a Lean-capable environment and preserve the command, toolchain, build log, exit status, and tested commit SHA.

## Historical claim ceiling — 2026-10-17 (superseded for the baseline build)

At this earlier checkpoint, the files had only been written as a candidate minimal Lean project; no successful `lake build`, `#eval`, or kernel-acceptance observation was available **then**. The later successful baseline CI run and its precise scope are documented below.

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

## 2026-10-18 — GitHub Actions engineering build observed

- Workflow: `Engineering lab build`.
- Run: https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427
- Tested commit: `f445a1ee5efb33f1c88d316158b6c5586f11ff0f`.
- GitHub Actions run state: `completed`; conclusion: `success`.
- Job: `engineering-lake-build`; conclusion: `success`.
- Steps `Inspect pinned toolchain` and `Build engineering project`: both reported `success`.
- Evidence source: GitHub Actions run and jobs metadata. Raw stdout/stderr and explicit process exit code were not retrieved in this observation.
- Claim ceiling: GitHub-hosted workflow completed its configured engineering build successfully for the specified commit. This does not establish third-party local reproduction, correctness of all Book exercises, or any real-world safety claim.
- Next: retrieve job logs if available, then audit Book chapter commands against the built lab and independently reproduce on a separate environment.

**Current status:** CI BUILD SUCCESS OBSERVED (commit-bound); THIRD-PARTY REPRODUCTION NOT VERIFIED.

## 2026-10-18 — raw GitHub Actions job log readback

- Observed [run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427), job ID `117449458630` (`engineering-lake-build`), via GitHub Actions job log.
- Checked-out commit: `f445a1ee5efb33f1c88d316158b6c5586f11ff0f` (checkout / `git log -1` in the job log).
- Runner: Ubuntu 24.04.5 LTS (GitHub-hosted).
- Toolchain: `leanprover/lean4:v4.24.0`.
- Tool output: `Lake version 5.0.0-src+797c613 (Lean version 4.24.0)`.
- Working directory: `engineering` (workflow run default).
- Command: `lake build`.
- Relevant observed output:

```text
ℹ [2/3] Built ProofEngineeringLab (187ms)
info: ProofEngineeringLab.lean:3:0: double (n : Nat) : Nat
info: ProofEngineeringLab.lean:4:0: 6
Build completed successfully (3 jobs).
```

- Job and build step conclusion: `success`; the shell step used `bash -e` and reached successful job completion. The raw log does not print an explicit numeric exit code, so no numeric exit code is asserted here.
- Claim ceiling: this demonstrates a successful build and the displayed Lean elaboration/evaluation messages **for that commit and CI environment**. It is not independent third-party reproduction or empirical validation of the modeled system.

## 2026-10-20 — teaching-source check configured; runtime result pending

- Fixed Chapter 07 sample name inconsistency: the split `Basic.lean` now defines the same top-level `double` as the Book's baseline, and `Examples.lean` checks that exact symbol. Confirmed GitHub contents readback, **not** a Lean build result.
- Created `engineering/scripts/verify-teaching-examples.sh` at commit `90826339784ca080ccadf19936bbda95645d77ad`: proposes per-file typecheck for the independent chapter/bonus sources, an isolated Chapter 07 split-module build and an intentional Chapter 18 failure check.
- Updated `.github/workflows/engineering-build.yml` at commit `124c96a8b7306dc18514c2d81a38873a107af954` to invoke that script after the existing baseline `lake build`. Readback confirmed the workflow contents.
- **No latest workflow run ID/job log/terminal result was retrieved in this observation.** The connector's empty combined-status or PR-filtered run lists are not evidence of pass or failure; direct public API access was unavailable. Accordingly, **new teaching-source and negative-case checks remain NOT VERIFIED**.
- Next: inspect the actual Actions job result for the checked-out SHA and the `Verify book chapter and bonus examples` step; if it failed, fix source or script based on the exact failure log and recheck. Append the tested commit, environment, command, outcome and observed error messages once available.
