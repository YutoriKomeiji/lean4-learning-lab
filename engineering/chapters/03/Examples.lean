-- Chapter 03: named theorems and their exact propositions.
-- Candidate source: NOT YET TYPECHECKED independently.
namespace Chapter03

def double (n : Nat) : Nat := n + n

theorem double_three : double 3 = 6 := by
  rfl

theorem double_zero : double 0 = 0 := by
  rfl

-- An impressive name does not change the proved proposition.
theorem CompletelySafeSystem : double 3 = 6 := by
  exact double_three

end Chapter03
