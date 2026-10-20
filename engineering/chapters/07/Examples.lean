-- Chapter 07: proposed import counterpart.
-- First copy Basic.lean into engineering/ProofEngineeringLab/Basic.lean.
-- This file demonstrates its original top-level "double" definition.
-- This example is not automatically included in the current lake build target.
-- Candidate only; not covered by historical CI evidence.
import ProofEngineeringLab.Basic

#check double
#eval double 3
example : double 3 = 6 := by
  rfl
