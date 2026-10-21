-- Chapter 02: definitions and concrete evaluation.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278).
namespace Chapter02

def double (n : Nat) : Nat := n + n
#check double
#eval double 0
#eval double 3
#eval double 4

example : double 3 = 6 := by rfl
example : double 0 = 0 := by rfl

end Chapter02
