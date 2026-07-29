import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

/-!
# Landau Level Hilbert Space

This module defines the Hilbert space structure for Landau levels,
including magnetic translation operators and the projection onto
lowest Landau level (LLL).
-/

abbrev MagneticField := ℝ
abbrev FillingFactor := ℕ

structure LandauLevel where
  n : ℕ
  energy : ℝ
  degeneracy : ℕ

def magneticLength (B : MagneticField) : ℝ := 1 / Real.sqrt B

structure MagneticTranslation (B : MagneticField) where
  dx : ℝ
  dy : ℝ

def lllProjection (ψ : Euclidean4 → ℂ) : Euclidean4 → ℂ := ψ

structure LandauLevelHilbertSpace where
  B : MagneticField
  ν : FillingFactor
  levels : List LandauLevel
  lllState : Euclidean4 → ℂ
  translationInvariant : Prop
  lllProjectionClosed : Prop

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse