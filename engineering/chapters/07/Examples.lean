-- Chapter 07: proposed import counterpart.
-- Run only after arranging the module search path described in chapter README.
-- Candidate only; not included in the existing CI evidence.
import Basic

#check Chapter07.double
#eval Chapter07.double 3
example : Chapter07.double 3 = 6 := by
  rfl
