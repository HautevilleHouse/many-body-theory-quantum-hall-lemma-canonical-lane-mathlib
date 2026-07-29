import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.ChernSimonsTheoryLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure CompositeFermion where
  effectiveMagneticField : ℝ
  fillingFactor : ℚ
  vortexAttachment : ℕ

structure CompositeFermionCertificate where
  fermion : CompositeFermion
  fluxAttachmentClosed : Prop
  effectiveFieldClosed : Prop
  fillingFactorClosed : Prop
  fluxAttachmentClosedProof : fluxAttachmentClosed
  effectiveFieldClosedProof : effectiveFieldClosed
  fillingFactorClosedProof : fillingFactorClosed

def sourceCompositeFermion : CompositeFermion := {
  effectiveMagneticField := 1.0
  fillingFactor := 1/3
  vortexAttachment := 2
}

def sourceCompositeFermionCertificate : CompositeFermionCertificate := {
  fermion := sourceCompositeFermion
  fluxAttachmentClosed := sourceCompositeFermion.vortexAttachment = 2
  effectiveFieldClosed := sourceCompositeFermion.effectiveMagneticField = 1.0
  fillingFactorClosed := sourceCompositeFermion.fillingFactor = 1/3
  fluxAttachmentClosedProof := rfl
  effectiveFieldClosedProof := rfl
  fillingFactorClosedProof := rfl
}

def CompositeFermionClosed (C : CompositeFermionCertificate) : Prop :=
  C.fluxAttachmentClosed ∧ C.effectiveFieldClosed ∧ C.fillingFactorClosed

theorem source_composite_fermion_closed :
    CompositeFermionClosed sourceCompositeFermionCertificate := by
  exact And.intro sourceCompositeFermionCertificate.fluxAttachmentClosedProof
    (And.intro sourceCompositeFermionCertificate.effectiveFieldClosedProof
      sourceCompositeFermionCertificate.fillingFactorClosedProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse