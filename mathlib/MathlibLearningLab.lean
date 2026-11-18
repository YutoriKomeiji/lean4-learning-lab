import Mathlib

/-!
# Mathlib Learning Lab — first exercises

DAN-106 companion source candidate; pending first actual typecheck.

The point of this example is to read what a theorem says before using it.
No statement below describes the safety or adequacy of a real system.
-/

-- Inspect the types of the facts you intend to use.
#check Nat.add_comm
#check mul_le_mul_of_nonneg_right

-- A direct use of a previously established commutativity theorem.
example (a b : ℕ) : a + b = b + a := by
  exact Nat.add_comm a b

-- A Mathlib tactic turns a polynomial identity into a routine exercise.
example (x y : ℤ) : (x + y) ^ 2 = x ^ 2 + 2 * x * y + y ^ 2 := by
  ring

-- The nonnegativity hypothesis matters: removing it changes the claim.
example (a b c : ℝ) (hab : a ≤ b) (hc : 0 ≤ c) : a * c ≤ b * c := by
  exact mul_le_mul_of_nonneg_right hab hc
