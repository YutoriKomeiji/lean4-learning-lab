/-!
Bonus 01: a tiny access-control policy, not a production authorization system.
Candidate only. This file has NOT been independently typechecked.
-/
namespace BonusAccess

inductive Role where
  | guest
  | editor
  | admin
  deriving DecidableEq, Repr

inductive Action where
  | read
  | edit
  | approve
  deriving DecidableEq, Repr

-- Permission rules are *defined* by these constructors.
inductive Allowed : Role → Action → Prop where
  | guestRead : Allowed .guest .read
  | editorRead : Allowed .editor .read
  | editorEdit : Allowed .editor .edit
  | adminRead : Allowed .admin .read
  | adminEdit : Allowed .admin .edit
  | adminApprove : Allowed .admin .approve

-- A specific authorization is derivable from the rules.
theorem admin_can_approve : Allowed .admin .approve := by
  exact Allowed.adminApprove

-- Guest approval cannot be derived from this closed constructor set.
theorem guest_cannot_approve : ¬ Allowed .guest .approve := by
  intro h
  cases h

-- In this *model*, only an admin has an approval permission.
theorem approve_implies_admin (r : Role) (h : Allowed r .approve) : r = .admin := by
  cases h
  rfl

-- Readers can change the rules and inspect whether old statements still hold.
-- What is NOT proved: authentication, enforcement in a real service,
-- revocation, persistence, network isolation, human approval, or compliance.
end BonusAccess
