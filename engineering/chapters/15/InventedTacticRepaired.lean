-- Educational repaired counterpart; isolated Lean typecheck required.
-- This only establishes the toy statement double 3 = 6.
namespace CasebookTactic

def double (n : Nat) : Nat := n + n

theorem double_three : double 3 = 6 := by
  rfl

end CasebookTactic
