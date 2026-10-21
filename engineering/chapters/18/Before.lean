-- Chapter 18: original specification candidate.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8; isolated from main build.
namespace Chapter18Before
inductive State where
  | idle | running | stopped

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped

theorem stopped_cannot_restart : ¬ CanStep .stopped .running := by
  intro h
  cases h
end Chapter18Before
