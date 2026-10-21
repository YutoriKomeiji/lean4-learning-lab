-- Chapter 06: passing theorem versus intended specification.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278).
namespace Chapter06

def isSafe (_ : Nat) : Prop := True

theorem FormalSafetyGuarantee (n : Nat) : isSafe n := by
  trivial

-- What this actually proves: isSafe is defined to mean True.
-- NOT proven: real-world safety, fitness of the model, or approval.
end Chapter06
