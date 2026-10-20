#!/usr/bin/env bash
# Small, bounded checks for the accompanying teaching sources (Lean 4 v4.24.0).
# Run from the engineering/ project directory.
# The intentional failure is checked separately and must NOT enter lake build.
set -euo pipefail

echo "TEACHING_EXAMPLES: start"
echo "Toolchain: $(cat lean-toolchain)"
echo "Working directory: $PWD"
echo "Lean version: $(lean --version)"
echo "Source commit: $(git rev-parse HEAD 2>/dev/null || echo UNKNOWN)"

for file in \
  chapters/02/Examples.lean \
  chapters/03/Examples.lean \
  chapters/06/Examples.lean \
  chapters/16/Examples.lean \
  chapters/17/Examples.lean \
  chapters/18/Before.lean \
  chapters/18/AfterRepaired.lean \
  bonus/access-control/AccessControl.lean \
  bonus/high-assurance/TwoPersonGate.lean \
  bonus/high-assurance/VersionBoundApproval.lean
do
  echo "TYPECHECK_BEGIN: $file"
  lake env lean "$file"
  echo "TYPECHECK_PASS: $file"
done

echo "SPLIT_VARIANT: create an isolated copy of the Chapter 07 exercise"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
mkdir -p "$stage/ProofEngineeringLab"
cp lakefile.toml lean-toolchain ProofEngineeringLab.lean "$stage/"
cp chapters/07/Basic.lean "$stage/ProofEngineeringLab/Basic.lean"
cp chapters/07/Examples.lean "$stage/Chapter07Demo.lean"
if ! grep -Fxq 'def double (n : Nat) : Nat := n + n' "$stage/ProofEngineeringLab.lean"; then
  echo "Chapter 07 baseline definition not found; cannot safely split" >&2
  exit 1
fi
sed -i '/^def double (n : Nat) : Nat := n + n$/d' "$stage/ProofEngineeringLab.lean"
{ printf 'import ProofEngineeringLab.Basic\n'; cat "$stage/ProofEngineeringLab.lean"; } > "$stage/ProofEngineeringLab.tmp"
mv "$stage/ProofEngineeringLab.tmp" "$stage/ProofEngineeringLab.lean"
(
  cd "$stage"
  lake build
  lake env lean Chapter07Demo.lean
)
echo "SPLIT_VARIANT_PASS: chapter 07 split module and import"

echo "EXPECTED_FAILURE_BEGIN: chapters/18/AfterIntentionalFailure.lean"
failure_log="$stage/intentional-failure.log"
if lake env lean chapters/18/AfterIntentionalFailure.lean >"$failure_log" 2>&1; then
  cat "$failure_log"
  echo "EXPECTED_FAILURE_MISSING: the intentionally invalid old theorem unexpectedly passed" >&2
  exit 1
fi
cat "$failure_log"
if ! grep -q 'error:' "$failure_log"; then
  echo "EXPECTED_FAILURE_DIAGNOSTIC_UNKNOWN: failed but no Lean diagnostic marker" >&2
  exit 1
fi
echo "EXPECTED_FAILURE_OBSERVED: intentional theorem contradiction was rejected"
echo "TEACHING_EXAMPLES: SUCCESS (positive checks passed; intended failure rejected)"
