import HautevilleHouse.MedicineOutbreakInvestigationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure OutbreakControlPackage where
  quarantineEffectiveness : Prop
  vaccinationCoverage : Prop
  contactTracingEfficacy : Prop
  publicHealthInterventions : Prop
  outbreakContainmentThreshold : Prop
  interventionTiming : Prop

structure OutbreakControlEvidence (O : OutbreakControlPackage) where
  quarantineEffectivenessClosed : O.quarantineEffectiveness
  vaccinationCoverageClosed : O.vaccinationCoverage
  contactTracingEfficacyClosed : O.contactTracingEfficacy
  publicHealthInterventionsClosed : O.publicHealthInterventions
  outbreakContainmentThresholdClosed : O.outbreakContainmentThreshold
  interventionTimingClosed : O.interventionTiming

def OutbreakControlClosed (O : OutbreakControlPackage) : Prop :=
  O.quarantineEffectiveness ∧ O.vaccinationCoverage ∧ O.contactTracingEfficacy ∧ O.publicHealthInterventions ∧ O.outbreakContainmentThreshold ∧ O.interventionTiming

theorem outbreak_control_closed_from_evidence (O : OutbreakControlPackage) (E : OutbreakControlEvidence O) : OutbreakControlClosed O := by
  exact And.intro E.quarantineEffectivenessClosed (And.intro E.vaccinationCoverageClosed (And.intro E.contactTracingEfficacyClosed (And.intro E.publicHealthInterventionsClosed (And.intro E.outbreakContainmentThresholdClosed E.interventionTimingClosed))))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse