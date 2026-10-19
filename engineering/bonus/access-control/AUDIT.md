# Access control example — claim and evidence audit

Status: **CODE CANDIDATE / NOT TYPECHECKED IN THIS RUN**

## Intended teaching claim
An access-control policy can be modeled as roles, actions, and permitted combinations; Lean can check propositions about the model once code is successfully elaborated.

## Actual definitions
`Role` has three constructors: guest/editor/admin. `Action` has read/edit/approve. `Allowed` is an inductive relation with exactly six listed permission constructors. There is no generic allow rule.

## Intended theorems
- `admin_can_approve`: the policy contains admin approval.
- `guest_cannot_approve`: the constructors do not permit guest approval.
- `approve_implies_admin`: an approval permission in this model comes with role admin.

These are **candidate theorems until verified by Lean**. Do not equate this prose with a successful kernel acceptance.

## Proof Ceiling
If a pinned toolchain accepts these definitions and proofs, the result supports only the specified propositions of this formal model with its actual dependencies and assumptions. The names do not prove the policy meets an organization's needs.

## What was NOT proved
- User identity/authentication and role assignment
- Enforcement in any application, database, API, or deployment
- Audit log integrity and resistance to abuse
- Revocation, time limits, delegation, separation of duties
- Legal/regulatory compliance or organizational approval
- Semantic match between this toy policy and a real policy

## Validation checklist
- [ ] Record commit SHA and pinned Lean version
- [ ] Execute `lean bonus/access-control/AccessControl.lean` under `engineering/`
- [ ] Record exact output and exit code (no invented PASS)
- [ ] Independently reproduce from another environment
- [ ] Attempt policy change and inspect what breaks

**Current evidence:** the source and explanatory text exist. Existing engineering CI success is scoped to its earlier tested commit and does not cover this file.
