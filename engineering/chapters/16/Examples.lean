-- Chapter 16: small state-machine specification.
-- Candidate source: NOT YET TYPECHECKED independently.
namespace Chapter16

inductive State where
  | idle | running | stopped
  deriving DecidableEq, Repr

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped

-- A formalization of selected permitted transitions, not a physical machine.
example : CanStep .idle .running := CanStep.start
example : CanStep .running .stopped := CanStep.stop

end Chapter16
