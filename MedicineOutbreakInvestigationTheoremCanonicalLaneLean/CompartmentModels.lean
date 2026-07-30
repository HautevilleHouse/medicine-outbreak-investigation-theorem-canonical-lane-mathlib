import HautevilleHouse.MedicineOutbreakInvestigationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  susceptibleCompartment : Type u
  exposedCompartment : Type v
  infectedCompartment : Type w
  recoveredCompartment : Type x
  totalPopulation : Prop
  transitionRatesDefined : Prop
  basicReproductionNumber : Prop
  initialConditionsSet : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  totalPopulationClosed : M.totalPopulation
  transitionRatesDefinedClosed : M.transitionRatesDefined
  basicReproductionNumberClosed : M.basicReproductionNumber
  initialConditionsSetClosed : M.initialConditionsSet

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.totalPopulation ∧ M.transitionRatesDefined ∧ M.basicReproductionNumber ∧ M.initialConditionsSet

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage) (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.totalPopulationClosed (And.intro E.transitionRatesDefinedClosed (And.intro E.basicReproductionNumberClosed E.initialConditionsSetClosed))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse