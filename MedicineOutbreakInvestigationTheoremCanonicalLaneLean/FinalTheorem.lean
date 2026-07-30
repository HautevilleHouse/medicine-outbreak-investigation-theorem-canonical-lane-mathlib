import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

def ConstrainedMedicineOutbreakClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_medicine_outbreak_endgame (A : AdmissibleClass) :
    ConstrainedMedicineOutbreakClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse