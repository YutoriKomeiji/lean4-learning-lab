# Bonus 02 — assurance case / Proof Ceiling

**Stage:** source candidate, NOT TYPECHECKED. **Production suitability:** NOT ESTABLISHED.

## Claimed formal properties (candidate)
1. A supplied `ExecutionPermit d` entails `HasTwoDistinctApprovals d`.
2. If `d.first = none`, the modeled permit cannot be constructed.
3. The definition of `HasTwoDistinctApprovals` requires two distinct actor identifiers, bound to the same request and distinct from the proposer.

## Assumptions and missing semantics
- ActorId and RequestId are natural numbers; their link to real humans is absent.
- Approvals are unchecked records; signatures, authority, consent, and freshness are not modeled.
- `ExecutionPermit` is a proposition about abstract data, not an executable authorization gateway.
- Temporal ordering, stale approvals, version changes, revocation, exception paths, and execution effects are not modeled.
- Real system implementation, enforcement, threat model, regulatory mapping, and safety case are absent.

## Counterfactuals for future adversarial exercises
- Two records from one actor: condition `a.actor ≠ b.actor` cannot be satisfied.
- Records for a different request: request-binding condition fails.
- Approval by the proposer: separation condition fails.
- Real identity forged despite distinct numbers: **not detectable** by this model.
- Approval valid yesterday but revoked today: **not representable**.

## Evidence ladder
- Source candidate: PRESENT.
- Lean v4.24.0 typecheck: NOT RUN.
- Negative tests and mutation tests: NOT RUN.
- CI bound to the new source SHA: NOT RUN.
- Independent reproducibility: NOT VERIFIED.
- Domain-specific safety/security/privacy/legal validation: NOT PERFORMED.
- External deployment authority: NONE.

**Authority boundary:** No clinical, financial, industrial, public-service or agentic action is authorized by this artifact. Human decision and separately verified domain controls remain required.
