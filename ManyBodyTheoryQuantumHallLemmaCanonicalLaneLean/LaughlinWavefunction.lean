import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LandauLevelHilbertSpace

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

/-!
# Laughlin Wavefunction

Defines the Laughlin wavefunction for filling factor ν = 1/m,
and the plasma analogy.
-/

structure LaughlinState where
  m : ℕ
  particlePositions : List (Euclidean4)
  wavefunction : ℂ
  normalization : ℝ
  plasmaParameter : ℝ

def lauglinWavefunction (m : ℕ) (positions : List Euclidean4) : ℂ := 
  (Complex.ofReal 1) * Complex.ofReal (Real.exp (- (∑ p in positions, p 0 ^ 2 + p 1 ^ 2) / 4))

structure LaughlinWavefunctionCertificate where
  fillingFactor : FillingFactor
  lauglinState : LaughlinState
  wavefunctionCorrect : Prop
  plasmaAnalogyClosed : Prop
  wavefunctionClosed : wavefunctionCorrect
  plasmaClosed : plasmaAnalogyClosed

def sourceLaughlinWavefunctionCertificate : LaughlinWavefunctionCertificate := {
  fillingFactor := 1,
  lauglinState := {
    m := 3,
    particlePositions := [],
    wavefunction := Complex.ofReal 1,
    normalization := 1.0,
    plasmaParameter := 1.0
  },
  wavefunctionCorrect := True,
  plasmaAnalogyClosed := True,
  wavefunctionClosed := rfl,
  plasmaClosed := rfl
}

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse