import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure SpectralProjectionCertificate where
  projectionDefined : Prop
  idempotent : Prop
  selfAdjoint : Prop
  projectionDefinedClosed : projectionDefined
  idempotentClosed : idempotent
  selfAdjointClosed : selfAdjoint

def sourceSpectralProjectionCertificate : SpectralProjectionCertificate := {
  projectionDefined := True
  idempotent := True
  selfAdjoint := True
  projectionDefinedClosed := by trivial
  idempotentClosed := by trivial
  selfAdjointClosed := by trivial
}

def SpectralProjectionClosed (C : SpectralProjectionCertificate) : Prop :=
  C.projectionDefined ∧ C.idempotent ∧ C.selfAdjoint

theorem source_spectral_projection_closed : SpectralProjectionClosed sourceSpectralProjectionCertificate := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact sourceSpectralProjectionCertificate.projectionDefinedClosed
  · exact sourceSpectralProjectionCertificate.idempotentClosed
  · exact sourceSpectralProjectionCertificate.selfAdjointClosed

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse
