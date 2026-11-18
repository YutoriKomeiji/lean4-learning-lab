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

