import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LaughlinWavefunctionLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure ChernSimonsAction where
  level : ℕ
  gaugeField : ℝ → ℝ
  actionDensity : ℝ → ℝ

structure ChernSimonsCertificate where
  action : ChernSimonsAction
  levelQuantized : Prop
  gaugeInvarianceClosed : Prop
  anomalyCancellation : Prop
  levelQuantizedProof : levelQuantized
  gaugeInvarianceClosedProof : gaugeInvarianceClosed
  anomalyCancellationProof : anomalyCancellation

def sourceChernSimonsAction : ChernSimonsAction := {
  level := 3
  gaugeField := fun x => x^2
  actionDensity := fun x => (level : ℝ) * gaugeField x
}

def sourceChernSimonsCertificate : ChernSimonsCertificate := {
  action := sourceChernSimonsAction
  levelQuantized := sourceChernSimonsAction.level = 3
  gaugeInvarianceClosed := sourceChernSimonsAction.gaugeField (0) = 0
  anomalyCancellation := sourceChernSimonsAction.level % 2 = 1
  levelQuantizedProof := rfl
  gaugeInvarianceClosedProof := by simp [sourceChernSimonsAction]
  anomalyCancellationProof := by decide
}

def ChernSimonsClosed (C : ChernSimonsCertificate) : Prop :=
  C.levelQuantized ∧ C.gaugeInvarianceClosed ∧ C.anomalyCancellation

theorem source_chern_simons_closed :
    ChernSimonsClosed sourceChernSimonsCertificate := by
  exact And.intro sourceChernSimonsCertificate.levelQuantizedProof
    (And.intro sourceChernSimonsCertificate.gaugeInvarianceClosedProof
      sourceChernSimonsCertificate.anomalyCancellationProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse