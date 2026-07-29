import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LandauLevelHilbertSpace

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

/-!
# Interaction Hamiltonian

Defines the Coulomb interaction projected to the lowest Landau level
and the Haldane pseudopotentials.
-/

structure HaldanePseudopotential where
  m : ℤ
  V_m : ℝ

structure InteractionHamiltonian where
  lllSpace : LandauLevelHilbertSpace
  coulombPotential : (Euclidean4 → Euclidean4 → ℝ)
  projectedInteraction : Prop
  pseudopotentials : List HaldanePseudopotential
  hamiltonianClosed : Prop

def zeroInteractionHamiltonian : InteractionHamiltonian := {
  lllSpace := {
    B := 1.0,
    ν := 1,
    levels := [],
    lllState := fun _ => 0,
    translationInvariant := True,
    lllProjectionClosed := True
  },
  coulombPotential := fun _ _ => 0,
  projectedInteraction := True,
  pseudopotentials := [],
  hamiltonianClosed := True
}

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse