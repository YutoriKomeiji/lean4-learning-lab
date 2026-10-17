# Repository rename and companion-book migration

## Identity and scope

- Repository id: `1366849977`; former name: `YutoriKomeiji/lean4-proof-literacy-lab`; current name: `YutoriKomeiji/lean4-learning-lab`.
- 2026-09-12: original Proof Literacy educational experiment and first recorded evaluator observations.
- Original frozen formal/build inputs remain **at repository root**; `Lean4ProofLiteracyLab.lean`, `lakefile.lean`, `lean-toolchain`, `AUDIT.md`, `EXPERIMENT_PROTOCOL.md`, `fixtures/`, `evidence/` were not moved.
- Prior formal-input commit: `040bf196c8277db68627681d67e639bc3458d6f0`; recorded public readback revision: `8d8d5c38b57eabc31e08a72813412f729331edff`.
- Existing `AUDIT.md` references workflow run `34671787946`, which documents build success for frozen **historical** formal inputs, not this migration.

## Presentation / evidence boundary

The repository name and root README are part of the presentation seen by external evaluators. The renamed repository and expanded two-book README are a **new presentation condition**. The 2026-09-12 baseline observation and other past observations are preserved as dated historical evidence; they are not prospective results for the changed presentation. Do not silently compare old and new responses as a controlled experiment.

## Companion books

- Introductory Zenn Book source: private `YutoriKomeiji/zenn-content/books/lean4-proof-literacy/`.
- Technical Zenn Book source: private `YutoriKomeiji/zenn-content/books/lean4-proof-engineering/` (`published: false`).
- Technical executable lab **copied** from `zenn-content/drafts/lean4-proof-engineering/lab/` to public `engineering/` on 2026-10-18. The private original has not been deleted. No older private commits or hidden research artifacts were promoted into this repository.
- The engineering project is a separate Lake root with its own `lean-toolchain`; an engineering build cannot be treated as verification of the frozen root experiment and vice versa.

## Before interpreting CI

The legacy root workflow remains manual (`workflow_dispatch`). Engineering has its own scoped workflow. Check specific commit, job, Lean version, command, and terminal outcome. No CI success is claimed by this migration text.

## Historical citations

Links that embed the **old name** in Zenn/GitHub documents can redirect while GitHub retains the rename mapping. Do not reuse the old repository name or assume all old paths were moved. New educational references should use the canonical new URL.
