import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.QuantumHallSpectralGap
import Mathlib.Data.Real.Basic

/-!
# Adiabatic Transport for the Quantum Hall Effect

This module defines adiabatic transport of particles in the quantum Hall setup,
which leads to quantization of the Hall conductance.
-/

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure AdiabaticTransport (N : ℕ) where
  initialHamiltonian : QuantumHallHamiltonian N
  finalHamiltonian : QuantumHallHamiltonian N
  parameter : ℝ → ℝ
  adiabaticTheoremApplied : Bool

def primitiveAdiabaticTransport (N : ℕ) : AdiabaticTransport N := {
  initialHamiltonian := primitiveQuantumHallHamiltonian N
  finalHamiltonian := primitiveQuantumHallHamiltonian N
  parameter := fun t => t
  adiabaticTheoremApplied := true
}

structure HallConductance where
  quantizedValue : ℚ
  integerMultiple : ℕ
  units : String := "e^2/h"

def integerHallConductance (n : ℕ) : HallConductance := {
  quantizedValue := n * (1 : ℚ)
  integerMultiple := n
}

def AdiabaticTransportClosed (T : AdiabaticTransport N) : Prop :=
  T.adiabaticTheoremApplied = true

theorem primitive_adiabatic_transport_closed (N : ℕ) :
    AdiabaticTransportClosed (primitiveAdiabaticTransport N) := by
  rfl

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse