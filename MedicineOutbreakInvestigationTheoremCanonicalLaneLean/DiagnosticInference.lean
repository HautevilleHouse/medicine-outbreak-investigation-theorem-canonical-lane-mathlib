import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Diagnostic Inference Package (Outbreak Investigation)

This module defines structures for diagnostic test characteristics and inference
in outbreak investigation, including sensitivity, specificity, and predictive values.
-/

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : ℝ
  specificity : ℝ
  diseasePrevalence : ℝ
  testPositivePredictiveValue : ℝ
  testNegativePredictiveValue : ℝ
  valuesBetweenZeroAndOne : 0 ≤ sensitivity ∧ sensitivity ≤ 1 ∧ 0 ≤ specificity ∧ specificity ≤ 1 ∧ 0 ≤ diseasePrevalence ∧ diseasePrevalence ≤ 1
  predictiveValuesComputed : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticTestPackage) where
  sensitivitySpecificityValid : D.valuesBetweenZeroAndOne
  predictiveValuesComputedClosed : D.predictiveValuesComputed

def DiagnosticInferenceClosed (D : DiagnosticTestPackage) : Prop :=
  D.valuesBetweenZeroAndOne ∧ D.predictiveValuesComputed

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivitySpecificityValid E.predictiveValuesComputedClosed

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse