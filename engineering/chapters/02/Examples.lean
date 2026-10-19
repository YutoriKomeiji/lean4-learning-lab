-- Chapter 02: definitions and concrete evaluation.
-- Candidate source: NOT YET TYPECHECKED independently.
namespace Chapter02

def double (n : Nat) : Nat := n + n
#check double
#eval double 0
#eval double 3
#eval double 4

example : double 3 = 6 := by rfl
example : double 0 = 0 := by rfl

end Chapter02
