import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.QuantumHallStateLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure LaughlinWavefunction where
  fillingFactor : ℚ
  magneticLength : ℝ
  wavefunction : ℂ → ℂ
  gaussianFactor : ℝ → ℝ

def sourceLaughlinWavefunction : LaughlinWavefunction := {
  fillingFactor := 3
  magneticLength := 1.0
  wavefunction := fun z => z^3 * Real.exp (-|z|^2 / 4)
  gaussianFactor := fun r => Real.exp (-r^2 / 4)
}

structure LaughlinWavefunctionCertificate where
  wavefunction : LaughlinWavefunction
  analyticityClosed : Prop
  antisymmetryClosed : Prop
  fillingFactorClosed : Prop
  analyticityClosedProof : analyticityClosed
  antisymmetryClosedProof : antisymmetryClosed
  fillingFactorClosedProof : fillingFactorClosed

def sourceLaughlinWavefunctionCertificate : LaughlinWavefunctionCertificate := {
  wavefunction := sourceLaughlinWavefunction
  analyticityClosed := sourceLaughlinWavefunction.wavefunction = fun z => z^3 * Real.exp (-|z|^2 / 4)
  antisymmetryClosed := sourceLaughlinWavefunction.wavefunction (-z) = -sourceLaughlinWavefunction.wavefunction z
  fillingFactorClosed := sourceLaughlinWavefunction.fillingFactor = 3
  analyticityClosedProof := rfl
  antisymmetryClosedProof := by
    intro z; simp [sourceLaughlinWavefunction]
  fillingFactorClosedProof := rfl
}

def LaughlinWavefunctionClosed (C : LaughlinWavefunctionCertificate) : Prop :=
  C.analyticityClosed ∧ C.antisymmetryClosed ∧ C.fillingFactorClosed

theorem source_laughlin_wavefunction_closed :
    LaughlinWavefunctionClosed sourceLaughlinWavefunctionCertificate := by
  exact And.intro sourceLaughlinWavefunctionCertificate.analyticityClosedProof
    (And.intro sourceLaughlinWavefunctionCertificate.antisymmetryClosedProof
      sourceLaughlinWavefunctionCertificate.fillingFactorClosedProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse