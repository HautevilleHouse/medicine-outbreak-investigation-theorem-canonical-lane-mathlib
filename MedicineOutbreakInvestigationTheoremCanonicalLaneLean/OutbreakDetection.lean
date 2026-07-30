import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationTheoremCanonicalLaneLean

structure OutbreakDetectionPackage where
  caseCount : Type u
  threshold : Prop
  temporalCluster : Prop
  spatialCluster : Prop
  earlyWarningSignal : Prop
  detectionClosed : Prop

structure OutbreakDetectionEvidence (O : OutbreakDetectionPackage) where
  caseCountDefined : O.caseCount
  thresholdClosed : O.threshold
  temporalClusterClosed : O.temporalCluster
  spatialClusterClosed : O.spatialCluster
  earlyWarningSignalClosed : O.earlyWarningSignal
  detectionClosedTerm : O.detectionClosed

def OutbreakDetectionClosed (O : OutbreakDetectionPackage) : Prop :=
  O.threshold ∧ O.temporalCluster ∧ O.spatialCluster ∧ O.earlyWarningSignal ∧ O.detectionClosed

theorem outbreak_detection_closed_from_evidence (O : OutbreakDetectionPackage) (E : OutbreakDetectionEvidence O) : OutbreakDetectionClosed O := by
  exact And.intro E.thresholdClosed (And.intro E.temporalClusterClosed (And.intro E.spatialClusterClosed (And.intro E.earlyWarningSignalClosed E.detectionClosedTerm)))

end MedicineOutbreakInvestigationTheoremCanonicalLaneLean
end HautevilleHouse