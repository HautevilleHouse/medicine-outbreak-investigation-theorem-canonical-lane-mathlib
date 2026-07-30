import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Compartment Model Package (Outbreak Investigation)

This module defines a compartmental model structure for outbreak investigation,
including susceptible, exposed, infected, recovered compartments, and their
transition parameters.
-/

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  susceptible : Type u
  exposed : Type v
  infected : Type w
  recovered : Type x
  transmissionRate : ℝ
  incubationRate : ℝ
  recoveryRate : ℝ
  populationSize : ℕ
  initialSusceptible : ℕ
  initialExposed : ℕ
  initialInfected : ℕ
  initialRecovered : ℕ
  transitionsDefined : Prop
  ratesPositive : transmissionRate > 0 ∧ incubationRate > 0 ∧ recoveryRate > 0

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  transitionsDefinedClosed : M.transitionsDefined
  ratesPositiveClosed : M.ratesPositive

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.transitionsDefined ∧ M.ratesPositive.1 ∧ M.ratesPositive.2.1 ∧ M.ratesPositive.2.2

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  have hPos : M.transmissionRate > 0 ∧ M.incubationRate > 0 ∧ M.recoveryRate > 0 := M.ratesPositive
  exact And.intro E.transitionsDefinedClosed
    (And.intro hPos.1 (And.intro hPos.2.1 hPos.2.2))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse