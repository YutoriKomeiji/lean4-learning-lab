-- Chapter 18: revised proposition after allowing the restart transition.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278).
namespace Chapter18Repaired
inductive State where
  | idle | running | stopped

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped
  | restart : CanStep .stopped .running

-- New specification: restart is allowed. This is not a proof of real-world safety.
theorem restart_is_allowed : CanStep .stopped .running := by
  exact CanStep.restart
end Chapter18Repaired
