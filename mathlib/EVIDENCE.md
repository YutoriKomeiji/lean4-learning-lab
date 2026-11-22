# Mathlib Learning Lab — Evidence and Verification Ledger

## 2026-11-18 JST — initial candidate, source-only checkpoint

- Target repo: `YutoriKomeiji/lean4-learning-lab`.
- Working branch: `work/dan106-mathlib-lab-20261118`.
- Project root: `mathlib/` (independent of historical root and `engineering/`).
- Expected Lean: `leanprover/lean4:v4.24.0`.
- Expected Mathlib: `leanprover-community/mathlib4`, tagged `v4.24.0`; tag commit inspected `f897ebcf72cd16f89ab4577d0c826cd14afaafc7`.
- Source example: `MathlibLearningLab.lean` with theorem inspection, commutativity, `ring`, and conditional inequality.
- **Source file present / static config checked**: yes, after GitHub file readback.
- **Lean / Lake / elan available in authoring runtime**: no (local command lookup).
- **Actual `lake update` / `lake exe cache get` / `lake build`**: NOT EXECUTED.
- **Actual Lean typecheck / kernel result**: NOT VERIFIED.
- **CI workflow result for this Mathlib project**: NONE; no Mathlib workflow configured, no CI claims.
- **Transitive dependency lockfile**: NOT GENERATED / NOT VERIFIED.
- **Third-party reproduction**: NOT VERIFIED.
- **Published Zenn Book state**: no publication action.

### Next verification transaction

1. In a toolchain-capable environment, enter `mathlib/` and record the tested repository commit SHA.
2. Run `lake --version`, `lake update`, then `lake exe cache get` (budget-check before downloading), and `lake build`.
3. Capture terminal logs / exit code and record any actual failures. Make minimal source fixes and re-run targeted checks as needed.
4. Commit a resolved `lake-manifest.json` for reproducibility after confirming the correct dependency resolution; this is **future work**, not claimed completed.
5. Only then promote the specific observed files from `CANDIDATE` to `BUILD VERIFIED`, naming exact source SHA, toolchain, commands and evidence scope.

### Proof ceiling

Mathlib dependency metadata and candidate Lean source are *not* successful proof evidence. Even a later successful build would only verify the encoded mathematical statements under the recorded assumptions, not any external-world guarantee.

## 2026-11-18 JST — 16-chapter companion candidate extension

- Source update commit: `78c53e50e3de02d6f3517faa4db61a6da88c5796`.
- File: `mathlib/MathlibLearningLab.lean`. File readback was **exact** after the GitHub write.
- Current static source inventory: **20 `example` declarations + 2 named `theorem` declarations** (excluding `#check` commands). These counts were obtained by inspecting file text, **not Lean parsing**.
- Coverage: chapter candidates 05 (rewrite/simp), 06 (Nat/Int), 07 (inequalities), 08 (sets/functions), 09 (logic), 12 (combined problems), 13 (named reusable lemma), 14 (responsible theorem naming); chapters 10 and 11 are search/source-inspection exercises in manuscripts.
- Static inspection: intended default target `MathlibLearningLab` references the same file name; dependency declaration contains Mathlib v4.24.0 tag. This is **configuration inspection only**.
- Local environment `command -v lean lake elan`: no executables found. **No executable Lean typecheck was performed.**
- `lake-manifest.json`: still absent. No `lake update`, Mathlib cache download, `lake build`, workflow run or independent reproduction performed in this transaction.
- Therefore all additions remain **CANDIDATE / NOT TYPECHECKED**; the manuscript's source snippets are pedagogical proposals, not recorded accepted proofs.
- Historical successful CI from the root or `engineering/` does **not** transfer to this new Mathlib project.
- Next validation: fixed-source and dependency readback; cache/storage preflight; run `lake update` and cache acquisition in a Lean-capable environment; commit manifest; run targeted `lake build`; preserve commands/output/exit codes, SHA, negative cases and actual module coverage.


## 2026-11-22 JST — independent CI execution and locked dependency checkpoint

This dated section supersedes **only the current-status observations** of the 2026-11-18 candidate-only checkpoint above. Preserve that earlier section as historical evidence.

### Lab compilation — PASS within defined scope

- GitHub Actions run [#44985441817](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/44985441817), commit `a847e7190c58385cf83aa9eb58ae66b4e2473c5b`, Ubuntu 24.04, `mathlib/` working directory.
- Actual Lean toolchain `leanprover/lean4:v4.24.0`; Lean commit `797c613eb9b6d4ec95db23e3e00af9ac6657f24b`; Lake `5.0.0-src+797c613`.
- `lake update`: exit 0, generated first manifest; `lake exe cache get`: success; `lake build MathlibLearningLab`: **success, 7352 jobs**, including this repo's `MathlibLearningLab.lean`. Do **not** generalize this to every Book Markdown snippet.
- Run #44985441817 artifact [#14739775476](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/44985441817/artifacts/14739775476): original artifact zip SHA-256 `4aca0b8cb771a8f1659423d1d75f084fbec21181eed67a94574b97c96dc78996`.
- Extracted `lake-manifest.json`: SHA-256 `73df9435ade21b9ff106e5b23faac10c5f9fe4c8717eddec47b8816e2952941c`, Git blob SHA `30a064dbe9c31c8f7736034998bf986bc9856bde`. The same generated bytes were committed to `mathlib/lake-manifest.json` on this work branch at commit `455571abc51128d5bb710c2e64a2322f024c71f1`; exact readback PASS.
- Mathlib resolved revision `f897ebcf72cd16f89ab4577d0c826cd14afaafc7` (`v4.24.0` input). Nine resolved package entries are committed. The lockfile is a **resolved snapshot**, not proof that all future networks/platforms will build.

### CH10 independent search experiment — PASS within defined scope

- GitHub Actions run [#44987633990](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/44987633990), commit `b310fa897c181cc1361101f643682e92914936eb`, terminal job result **success**.
- Used the committed manifest **without `lake update`**, confirmed manifest SHA-256 equals `73df9435ade21b9ff106e5b23faac10c5f9fe4c8717eddec47b8816e2952941c`. Lab target build success and three separate `lake env lean` invocations returned exit `0`.
- `experiments/Ch10ExactSearch.lean`: `Try this:\n  exact Nat.add_comm a b`.
- `experiments/Ch10ApplySearch.lean`: `Try this:\n  exact Nat.le_trans hab hbc`. This is **not** an observation of the manual `apply Nat.le_trans` tactic's intermediate goals.
- `experiments/Ch10ExplicitControls.lean`: exit 0; `#check Nat.add_comm` and `#check Nat.le_trans` displayed their types; manually constructed explicit control proofs typechecked.
- Run #44987633990 artifact [#14740348975](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/44987633990/artifacts/14740348975): archive SHA-256 `64d2b078a8edcb81086304faf2819b8ffbb943726a1f9ed7726026ba877cacee`. The file `evidence/ch10-exit-codes.tsv` records each exit code separately.
- Artifact storage retention is temporary; these notes retain source refs, outputs, commit IDs and hashes. The archived logs, not the natural-language summary, are the primary execution record.

### Remaining publication gates

- **Still unverified:** all 16 Zenn Book Markdown code fences individually typechecked against the final published manuscript; GUI editing/goal states for the search tactics; Zenn private Book deployment, render, cover, final reader reproduction, and full Japanese multi-lens review.
- This repo's successful Lean/Lake run is not proof of model adequacy, external operational safety, scientific approval, or publishing authority.
- Current new Book remains `published:false`; publication decision requires explicit Master Human Gate. Old public articles/Books and historical experiment are unaffected.
