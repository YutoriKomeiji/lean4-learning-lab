def double (n : Nat) : Nat := n + n

#check double
#eval double 3

example : double 3 = 6 := by
  rfl

inductive State where
  | idle
  | running
  | stopped
  deriving DecidableEq, Repr

inductive CanStep : State → State → Prop where
  | start : CanStep .idle .running
  | stop : CanStep .running .stopped
  | stayStopped : CanStep .stopped .stopped

example : CanStep .idle .running := CanStep.start
example : CanStep .running .stopped := CanStep.stop
example : CanStep .stopped .stopped := CanStep.stayStopped

theorem stopped_cannot_step_to_running :
    ¬ CanStep .stopped .running := by
  intro h
  cases h
