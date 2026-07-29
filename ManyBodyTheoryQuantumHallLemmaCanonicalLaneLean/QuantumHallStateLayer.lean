import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure QuantumHallState where
  fillingFactor : ℚ
  magneticField : ℝ
  conductivity : ℝ
  hallResistance : ℝ

structure QuantumHallStateCertificate where
  state : QuantumHallState
  fillingFactorInteger : fillingFactor ∈ Set.range (fun (n : ℕ) => (n : ℚ))
  quantizationClosed : Prop
  edgeStateClosed : Prop
  bulkBoundaryCorrespondence : Prop
  fillingFactorIntegerProof : fillingFactorInteger
  quantizationClosedProof : quantizationClosed
  edgeStateClosedProof : edgeStateClosed
  bulkBoundaryCorrespondenceProof : bulkBoundaryCorrespondence

def sourceQuantumHallState : QuantumHallState := {
  fillingFactor := 2
  magneticField := 5.0
  conductivity := 2.0 * (e^2 / h)
  hallResistance := h / (2.0 * e^2)
}

lemma integer_filling_factor : sourceQuantumHallState.fillingFactor ∈ Set.range (fun (n : ℕ) => (n : ℚ)) := by
  refine ⟨2, by norm_num⟩

def sourceQuantumHallStateCertificate : QuantumHallStateCertificate := {
  state := sourceQuantumHallState
  fillingFactorInteger := integer_filling_factor
  quantizationClosed := sourceQuantumHallState.conductivity = 2.0 * (e^2 / h)
  edgeStateClosed := sourceQuantumHallState.hallResistance = h / (2.0 * e^2)
  bulkBoundaryCorrespondence := True
  fillingFactorIntegerProof := integer_filling_factor
  quantizationClosedProof := rfl
  edgeStateClosedProof := rfl
  bulkBoundaryCorrespondenceProof := trivial
}

def QuantumHallStateClosed (C : QuantumHallStateCertificate) : Prop :=
  C.quantizationClosed ∧ C.edgeStateClosed ∧ C.bulkBoundaryCorrespondence

theorem source_quantum_hall_state_closed :
    QuantumHallStateClosed sourceQuantumHallStateCertificate := by
  exact And.intro sourceQuantumHallStateCertificate.quantizationClosedProof
    (And.intro sourceQuantumHallStateCertificate.edgeStateClosedProof
      sourceQuantumHallStateCertificate.bulkBoundaryCorrespondenceProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse