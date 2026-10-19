/-!
High-responsibility teaching model: two-person authorization gate.
EDUCATIONAL CANDIDATE / NOT TYPECHECKED.
Not an authorization implementation, medical device, financial control, or safety certification.
-/
namespace TwoPersonGate

abbrev ActorId := Nat
abbrev RequestId := Nat

structure Approval where
  request : RequestId
  actor : ActorId
  deriving DecidableEq, Repr

structure Decision where
  request : RequestId
  proposer : ActorId
  first : Option Approval
  second : Option Approval
  deriving Repr

-- Explicitly model two distinct human actors and request binding.
def HasTwoDistinctApprovals (d : Decision) : Prop :=
  ∃ a b : Approval,
    d.first = some a ∧
    d.second = some b ∧
    a.request = d.request ∧
    b.request = d.request ∧
    a.actor ≠ b.actor ∧
    a.actor ≠ d.proposer ∧
    b.actor ≠ d.proposer

-- A modeled execution permission is given *only* by a supplied proof
-- of HasTwoDistinctApprovals. Real-world execution is not modeled.
structure ExecutionPermit (d : Decision) : Prop where
  evidence : HasTwoDistinctApprovals d

theorem permit_requires_distinct_approvals (d : Decision)
    (h : ExecutionPermit d) : HasTwoDistinctApprovals d := by
  exact h.evidence

theorem no_approval_no_permit (d : Decision)
    (h : d.first = none) : ¬ ExecutionPermit d := by
  intro hp
  obtain ⟨a, b, ha, _, _, _, _, _, _⟩ := hp.evidence
  rw [h] at ha
  cases ha

-- This only proves properties of our chosen abstract definitions.
-- Identity proofing, revocation, trusted time, actual human presence,
-- logs, legal compliance, device control and real execution are absent.
end TwoPersonGate
