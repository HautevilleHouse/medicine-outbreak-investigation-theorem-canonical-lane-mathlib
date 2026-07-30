import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure MedicineOutbreakInvestigationAdmittedObject where
  outbreakData : Type
  epidemiologicalModel : Type
  parameterEstimates : Prop
  forecastReproductionNumber : Prop
  interventionEffectivenessEstimate : Prop

structure AdmissibleClass where
  object : MedicineOutbreakInvestigationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MedicineOutbreakInvestigationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse