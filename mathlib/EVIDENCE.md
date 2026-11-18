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
