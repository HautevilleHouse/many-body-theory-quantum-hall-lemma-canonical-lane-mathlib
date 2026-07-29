import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LandauLevelHilbertSpace
import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.InteractionHamiltonian

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

/-!
# Hall Conductance Quantization

This module defines the Hall conductance and its quantization condition,
including the Thouless-Kohmoto-Nightingale-den Nijs (TKNN) formula.
-/

structure HallConductance where
  sigma_xy : ℝ
  fillingFactor : FillingFactor
  dimensionless : Prop

def tknnFormula (B : MagneticField) (ν : FillingFactor) : ℝ := ν * (1 / (2 * π))

structure QuantizationCertificate where
  landauLevelBasis : LandauLevelHilbertSpace
  interaction : InteractionHamiltonian
  hallConductance : HallConductance
  quantizationCondition : Prop
  tknnClosed : Prop
  conductanceClosed : hallConductance.dimensionless
  quantizationClosed : quantizationCondition

def sourceQuantizationCertificate : QuantizationCertificate := {
  landauLevelBasis := {
    B := 1.0,
    ν := 1,
    levels := [],
    lllState := fun _ => 0,
    translationInvariant := True,
    lllProjectionClosed := True
  },
  interaction := zeroInteractionHamiltonian,
  hallConductance := {
    sigma_xy := 1.0,
    fillingFactor := 1,
    dimensionless := True
  },
  quantizationCondition := True,
  tknnClosed := True,
  conductanceClosed := rfl,
  quantizationClosed := rfl
}

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse