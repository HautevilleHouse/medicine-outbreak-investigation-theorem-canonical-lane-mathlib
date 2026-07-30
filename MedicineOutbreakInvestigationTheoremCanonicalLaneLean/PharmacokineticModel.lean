import HautevilleHouse.MedicineOutbreakInvestigationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  drugConcentration : Type u → Type v
  administrationRoute : Prop
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  dosingRegimen : Prop
  steadyStateAchieved : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  administrationRouteClosed : P.administrationRoute
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  dosingRegimenClosed : P.dosingRegimen
  steadyStateAchievedClosed : P.steadyStateAchieved

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.administrationRoute ∧ P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.dosingRegimen ∧ P.steadyStateAchieved

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.administrationRouteClosed (And.intro E.absorptionRateClosed (And.intro E.distributionVolumeClosed (And.intro E.eliminationRateClosed (And.intro E.dosingRegimenClosed E.steadyStateAchievedClosed))))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse