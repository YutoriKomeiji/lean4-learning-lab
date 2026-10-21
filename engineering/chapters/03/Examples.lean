-- Chapter 03: named theorems and their exact propositions.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278).
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
