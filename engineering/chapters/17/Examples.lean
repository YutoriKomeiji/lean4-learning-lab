-- Chapter 17: implementation-level model and a forbidden transition theorem.
-- Candidate source: NOT YET TYPECHECKED independently.
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
