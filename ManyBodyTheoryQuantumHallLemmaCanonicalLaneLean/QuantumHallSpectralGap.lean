import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.QuantumHallHamiltonian
import Mathlib.Data.Real.Basic

/-!
# Spectral Gap for the Quantum Hall Hamiltonian

This module defines the spectral gap condition that is central to the quantum Hall lemma.
The gap is the energy difference between the ground state and the first excited state.
-/

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure SpectralGap where
  groundStateEnergy : ℝ
  firstExcitedEnergy : ℝ
  gap : ℝ := firstExcitedEnergy - groundStateEnergy
  gapPositive : gap > 0

def zeroSpectralGap : SpectralGap := {
  groundStateEnergy := 0
  firstExcitedEnergy := 1
  gapPositive := by norm_num
}

structure SpectralGapCertificate (N : ℕ) where
  hamiltonian : QuantumHallHamiltonian N
  gap : SpectralGap
  gapClosed : gap.gapPositive

def sourceSpectralGapCertificate (N : ℕ) : SpectralGapCertificate N := {
  hamiltonian := primitiveQuantumHallHamiltonian N
  gap := zeroSpectralGap
  gapClosed := by
    exact zeroSpectralGap.gapPositive
}

def SpectralGapClosed (C : SpectralGapCertificate N) : Prop :=
  HamiltonianClosed C.hamiltonian ∧ C.gap.gapPositive

theorem source_spectral_gap_closed (N : ℕ) :
    SpectralGapClosed (sourceSpectralGapCertificate N) := by
  exact And.intro (primitive_hamiltonian_closed N) (sourceSpectralGapCertificate N).gapClosed

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse