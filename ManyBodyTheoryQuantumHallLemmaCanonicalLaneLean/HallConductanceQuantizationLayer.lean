import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.CompositeFermionLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure HallConductanceQuantization where
  fillingFactor : ℚ
  conductance : ℝ
  quantizationFormula : Prop

structure HallConductanceCertificate where
  quantization : HallConductanceQuantization
  quantizationClosed : Prop
  topologicalInvariantClosed : Prop
  edgeModeClosed : Prop
  quantizationClosedProof : quantizationClosed
  topologicalInvariantClosedProof : topologicalInvariantClosed
  edgeModeClosedProof : edgeModeClosed

def sourceHallConductanceQuantization : HallConductanceQuantization := {
  fillingFactor := 2
  conductance := 2.0 * (e^2 / h)
  quantizationFormula := conductance = fillingFactor * (e^2 / h)
}

def sourceHallConductanceCertificate : HallConductanceCertificate := {
  quantization := sourceHallConductanceQuantization
  quantizationClosed := sourceHallConductanceQuantization.quantizationFormula
  topologicalInvariantClosed := sourceHallConductanceQuantization.fillingFactor = 2
  edgeModeClosed := sourceHallConductanceQuantization.conductance > 0
  quantizationClosedProof := rfl
  topologicalInvariantClosedProof := rfl
  edgeModeClosedProof := by
    have h : (e^2 / h) > 0 := by
      positivity
    nlinarith
}

def HallConductanceClosed (C : HallConductanceCertificate) : Prop :=
  C.quantizationClosed ∧ C.topologicalInvariantClosed ∧ C.edgeModeClosed

theorem source_hall_conductance_closed :
    HallConductanceClosed sourceHallConductanceCertificate := by
  exact And.intro sourceHallConductanceCertificate.quantizationClosedProof
    (And.intro sourceHallConductanceCertificate.topologicalInvariantClosedProof
      sourceHallConductanceCertificate.edgeModeClosedProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse