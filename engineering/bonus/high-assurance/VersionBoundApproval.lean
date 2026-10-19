/-!
Bonus 03: request- and version-bound approval evidence.
EDUCATIONAL SAMPLE / NOT INDEPENDENTLY TYPECHECKED.
A natural-number version is a model field; no cryptographic or operational
freshness, real human identity, or external authority is established.
-/
namespace VersionBoundApproval

abbrev ActorId := Nat
abbrev RequestId := Nat
abbrev VersionId := Nat

structure Approval where
  request : RequestId
  version : VersionId
  actor : ActorId
  deriving DecidableEq, Repr

structure ChangeRequest where
  request : RequestId
  currentVersion : VersionId
  proposer : ActorId
  first : Option Approval
  second : Option Approval
  deriving Repr

def ValidPair (d : ChangeRequest) : Prop :=
  ∃ a b : Approval,
    d.first = some a ∧
    d.second = some b ∧
    a.request = d.request ∧
    b.request = d.request ∧
    a.version = d.currentVersion ∧
    b.version = d.currentVersion ∧
    a.actor ≠ b.actor ∧
    a.actor ≠ d.proposer ∧
    b.actor ≠ d.proposer

structure Permit (d : ChangeRequest) : Prop where
  evidence : ValidPair d

-- A permit contains a proof of the current model's conditions.
theorem permit_requires_valid_pair (d : ChangeRequest)
    (hp : Permit d) : ValidPair d :=
  hp.evidence

-- The first approval in an admitted pair is bound to the current version.
theorem first_approval_matches_version (d : ChangeRequest)
    (hp : Permit d) :
    ∃ a : Approval,
      d.first = some a ∧ a.version = d.currentVersion := by
  obtain ⟨a, b, ha, _hb, _ra, _rb, hva, _hvb, _diff, _sepA, _sepB⟩ :=
    hp.evidence
  exact ⟨a, ha, hva⟩

-- The model refuses a permit if no first approval is supplied.
theorem no_first_approval (d : ChangeRequest)
    (h : d.first = none) : ¬ Permit d := by
  intro hp
  obtain ⟨a, b, ha, _hb, _ra, _rb, _va, _vb, _diff, _sepA, _sepB⟩ :=
    hp.evidence
  rw [h] at ha
  cases ha

-- An old version number does not match a changed currentVersion by definition.
-- NOT modeled: identity proofing, signatures, revocation, trusted clocks,
-- persistence, delivery of approval, execution effects or human judgement.
end VersionBoundApproval
