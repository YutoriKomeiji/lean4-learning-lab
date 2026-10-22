-- Educational MOCK AI proposal (not a real AI transcript).
-- Intentionally invalid: expected Lean rejection, never part of lake build.
namespace CasebookTactic

def double (n : Nat) : Nat := n + n

theorem double_three : double 3 = 6 := by
  nonexistent_casebook_tactic_2026

end CasebookTactic
