import Mathlib

/-! DAN-106 CH10: observe apply? and compiler diagnostics separately. -/

example (a b c : ℕ) (hab : a ≤ b) (hbc : b ≤ c) :
    a ≤ c := by
  apply?
