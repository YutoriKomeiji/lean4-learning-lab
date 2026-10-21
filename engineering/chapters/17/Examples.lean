-- Chapter 17: implementation-level model and a forbidden transition theorem.
-- CI typecheck observed at commit e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8 (run #39431843278).
namespace Chapter17

inductive State where
  | idle | running | stopped
  deriving DecidableEq, Repr

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped

theorem stopped_cannot_restart : ¬ CanStep .stopped .running := by
  intro h
  cases h

-- This theorem does not establish anything beyond the declared CanStep relation.
end Chapter17
