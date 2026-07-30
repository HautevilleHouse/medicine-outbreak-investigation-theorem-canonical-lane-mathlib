import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  concentrationTimeCurve : Prop
  bioavailability : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  concentrationTimeCurveClosed : P.concentrationTimeCurve
  bioavailabilityClosed : P.bioavailability

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.concentrationTimeCurve ∧ P.bioavailability

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.concentrationTimeCurveClosed E.bioavailabilityClosed)))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse