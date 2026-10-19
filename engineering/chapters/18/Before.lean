-- Chapter 18: original specification candidate.
-- NOT separately typechecked; intentionally isolated from the main build.
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
