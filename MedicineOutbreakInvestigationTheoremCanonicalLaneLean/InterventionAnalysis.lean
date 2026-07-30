import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure InterventionAnalysisPackage where
  quarantineEffectiveness : Prop
  vaccinationCoverage : Prop
  treatmentEfficacy : Prop
  contactTracing : Prop
  publicHealthMeasures : Prop
  reproductionNumberReduction : Prop
  outbreakControl : Prop
  interventionValidity : Prop

structure InterventionAnalysisEvidence (I : InterventionAnalysisPackage) where
  quarantineEffectivenessClosed : I.quarantineEffectiveness
  vaccinationCoverageClosed : I.vaccinationCoverage
  treatmentEfficacyClosed : I.treatmentEfficacy
  contactTracingClosed : I.contactTracing
  publicHealthMeasuresClosed : I.publicHealthMeasures
  reproductionNumberReductionClosed : I.reproductionNumberReduction
  outbreakControlClosed : I.outbreakControl
  interventionValidityClosed : I.interventionValidity

def InterventionAnalysisClosed (I : InterventionAnalysisPackage) : Prop :=
  I.quarantineEffectiveness ∧ I.vaccinationCoverage ∧ I.treatmentEfficacy ∧
  I.contactTracing ∧ I.publicHealthMeasures ∧ I.reproductionNumberReduction ∧
  I.outbreakControl ∧ I.interventionValidity

theorem intervention_analysis_closed_from_evidence (I : InterventionAnalysisPackage) (E : InterventionAnalysisEvidence I) : InterventionAnalysisClosed I :=
  And.intro E.quarantineEffectivenessClosed
    (And.intro E.vaccinationCoverageClosed
      (And.intro E.treatmentEfficacyClosed
        (And.intro E.contactTracingClosed
          (And.intro E.publicHealthMeasuresClosed
            (And.intro E.reproductionNumberReductionClosed
              (And.intro E.outbreakControlClosed E.interventionValidityClosed))))))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse
