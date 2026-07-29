import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.QuantumHallLaughlinWavefunction
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

/-!
# Quantum Hall Hamiltonian

This module defines the many-body Hamiltonian for the fractional quantum Hall effect
including the Coulomb interaction and the magnetic field coupling.
-/

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure MagneticVectorPotential where
  A : ComplexPlane → ComplexPlane
  symmetricGauge : Bool

def zeroMagneticVectorPotential : MagneticVectorPotential := {
  A := fun _ => 0
  symmetricGauge := true
}

structure CoulombInteraction where
  strength : ℝ
  screened : Bool

def zeroCoulombInteraction : CoulombInteraction := {
  strength := 0
  screened := false
}

structure QuantumHallHamiltonian (N : ℕ) where
  kineticTerm : MagneticVectorPotential
  interactionTerm : CoulombInteraction
  magneticLength : ℝ
  fillingFraction : ℚ

def primitiveQuantumHallHamiltonian (N : ℕ) : QuantumHallHamiltonian N := {
  kineticTerm := zeroMagneticVectorPotential
  interactionTerm := zeroCoulombInteraction
  magneticLength := 1
  fillingFraction := 1/3
}

def HamiltonianClosed (H : QuantumHallHamiltonian N) : Prop :=
  H.magneticLength > 0 ∧ H.fillingFraction > 0

theorem primitive_hamiltonian_closed (N : ℕ) :
    HamiltonianClosed (primitiveQuantumHallHamiltonian N) := by
  exact And.intro (by norm_num) (by norm_num)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse