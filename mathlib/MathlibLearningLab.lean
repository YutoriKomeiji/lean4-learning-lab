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

/-! ## Book chapters 05–14: candidate exercises

These snippets are editorial candidates, not executed evidence.
They will be checked by the default Lake target only after the
Mathlib dependency has actually been resolved and the project built.
-/

namespace MathlibLearningLab

-- Ch05: use a specific equality to rewrite.
example (a b : ℕ) (h : a = b) : a + 3 = b + 3 := by
  rw [h]

example (a b : ℕ) (h : a = b) : b + 3 = a + 3 := by
  rw [← h]

example (a b : ℕ) : a + (0 + b) = b + a := by
  simp only [zero_add]
  exact Nat.add_comm a b

-- Ch06: natural subtraction saturates; integer subtraction does not.
example : (3 : ℕ) - 5 = 0 := by
  norm_num

example : (3 : ℤ) - 5 = -2 := by
  norm_num

example (x : ℤ) : x + (-x) = 0 := by
  ring

example (n : ℕ) : n ≤ n + 2 := by
  omega

-- Ch07: proof obligations in inequalities.
example (x : ℝ) : 0 ≤ x ^ 2 := by
  exact sq_nonneg x

example (x : ℝ) : 1 ≤ x ^ 2 + 1 := by
  nlinarith [sq_nonneg x]

-- Ch08: set inclusion and preimage.
example {α : Type} (s t : Set α) (hst : s ⊆ t)
    (x : α) (hx : x ∈ s) : x ∈ t := by
  exact hst hx

example {α β : Type} (f : α → β) (s : Set α)
    (t : Set β) (h : ∀ x ∈ s, f x ∈ t) :
    s ⊆ f ⁻¹' t := by
  intro x hx
  exact h x hx

-- Ch09: conjunction, implication, disjunction.
example (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  exact And.intro h.2 h.1

example (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) : P → R := by
  intro hp
  exact hqr (hpq hp)

example (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  rcases h with hp | hq
  · exact Or.inr hp
  · exact Or.inl hq

-- Ch12: combine algebraic normalization and cited facts.
example (a b : ℤ) :
    (a + b) ^ 2 - (a - b) ^ 2 = 4 * a * b := by
  ring

example (x : ℝ) : 1 ≤ (x + 3) ^ 2 + 1 := by
  have h : 0 ≤ (x + 3) ^ 2 := sq_nonneg (x + 3)
  linarith

-- Ch13: give the proved statement a precise, reusable name.
theorem square_plus_one_ge_one (x : ℝ) :
    1 ≤ x ^ 2 + 1 := by
  nlinarith [sq_nonneg x]

example (a : ℝ) : 1 ≤ (a + 5) ^ 2 + 1 := by
  exact square_plus_one_ge_one (a + 5)

-- Ch14: the premise is part of the theorem, not a footnote.
theorem preserves_order_when_nonnegative (a b c : ℝ)
    (hab : a ≤ b) (hc : 0 ≤ c) :
    a * c ≤ b * c := by
  exact mul_le_mul_of_nonneg_right hab hc

-- Ch14: inspect the exact named theorem and its axiom dependencies.
-- These commands print diagnostics; their presence does not certify the
-- mathematical model or prove that this source has been typechecked.
#check preserves_order_when_nonnegative
#print preserves_order_when_nonnegative
#print axioms preserves_order_when_nonnegative

-- The nonnegative-multiplier assumption is necessary.
-- For a negative multiplier, the inequality reverses direction.
example : (1 : ℝ) ≤ 2 := by
  norm_num

example : (2 : ℝ) * (-1) ≤ 1 * (-1) := by
  norm_num

-- Do not infer (1 * -1 ≤ 2 * -1) from 1 ≤ 2:
-- this would assert -1 ≤ -2 and is deliberately NOT a theorem here.

end MathlibLearningLab
