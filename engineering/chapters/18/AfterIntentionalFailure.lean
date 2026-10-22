-- Chapter 18: deliberately broken variant. EXPECTED TO FAIL TYPECHECK.
-- Do NOT import this in the production library or treat it as a passing example.
-- Expected rejection actually observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278): unsolved goals / False.
namespace Chapter18Failure
inductive State where
  | idle | running | stopped

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped
  | restart : CanStep .stopped .running

-- The old claim is now refutable by CanStep.restart.
theorem stopped_cannot_restart : ¬ CanStep .stopped .running := by
  intro h
  cases h
end Chapter18Failure
