-- Chapter 18: revised proposition after allowing the restart transition.
-- Candidate only; not independently typechecked.
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
