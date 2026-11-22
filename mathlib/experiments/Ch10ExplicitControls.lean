import Mathlib

/-! DAN-106 CH10: manually written explicit control proofs. -/

#check Nat.add_comm
#check Nat.le_trans

example (a b : ℕ) : a + b = b + a := by
  exact Nat.add_comm a b

example (a b c : ℕ) (hab : a ≤ b) (hbc : b ≤ c) :
    a ≤ c := by
  exact Nat.le_trans hab hbc

example (a b c : ℕ) (hab : a ≤ b) (hbc : b ≤ c) :
    a ≤ c := by
  apply Nat.le_trans
  · exact hab
  · exact hbc
