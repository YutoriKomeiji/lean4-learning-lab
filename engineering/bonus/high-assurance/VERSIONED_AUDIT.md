# Bonus 03 — version-bound approvals: evidence boundary

**Source candidate. NOT TYPECHECKED; NO NEW CI COVERAGE.**

## What is modeled
- A request id and current version number.
- Two approval records with their own request and version numbers.
- Two distinct approver identifiers separate from the proposer.
- A `Permit` proposition carrying evidence that these fields match the modeled constraints.

## Expected theorem obligations
- A `Permit d` contains `ValidPair d`.
- The first associated approval has the modeled current version.
- When `d.first = none`, a `Permit d` cannot be constructed.

These are **claims about the source to be verified**, not claims of completed kernel checking.

## Not established
- That a version number corresponds to the actual policy or document content.
- That a record came from a real, identified, eligible human.
- That an approval was voluntary, current, unrevoked, or cryptographically authentic.
- That an actual system checked these conditions before executing.
- That compliance, risk acceptance, or human authorization occurred.

## Adversarial cases to test
1. Old version against new currentVersion.
2. Matching numbers but tampered request payload.
3. Two approval records authored by the same person under different identifiers.
4. Approval withdrawn after record issuance.
5. Model passes while executable gateway ignores the model.

No execution logs are available for these cases. Avoid using `PASS` until toolchain and exact source SHA have been checked, and negative-case results are recorded.

## Next verification
From the engineering project directory, with pinned Lean v4.24.0 available:

```sh
lean bonus/high-assurance/VersionBoundApproval.lean
```

Record actual output, exit code, version, source commit, and machine/environment. This is not part of the historical `lake build` evidence.
