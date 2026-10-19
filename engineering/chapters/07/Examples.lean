-- Chapter 07: proposed import counterpart.
-- Copy Basic.lean into engineering/ProofEngineeringLab/Basic.lean and this file into engineering/Chapter07Demo.lean; compile through a configured Lake target. This source is not part of the current project targets.
-- Candidate only; not included in the existing CI evidence.
import ProofEngineeringLab.Basic

#check Chapter07.double
#eval Chapter07.double 3
example : Chapter07.double 3 = 6 := by
  rfl
