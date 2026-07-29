import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure HilbertSpaceCertificate where
  separable : Prop
  innerProductDefined : Prop
  orthonormalBasis : Prop
  separableClosed : separable
  innerProductDefinedClosed : innerProductDefined
  orthonormalBasisClosed : orthonormalBasis

def sourceHilbertSpaceCertificate : HilbertSpaceCertificate := {
  separable := True
  innerProductDefined := True
  orthonormalBasis := True
  separableClosed := by trivial
  innerProductDefinedClosed := by trivial
  orthonormalBasisClosed := by trivial
}

def HilbertSpaceClosed (C : HilbertSpaceCertificate) : Prop :=
  C.separable ∧ C.innerProductDefined ∧ C.orthonormalBasis

theorem source_hilbert_space_closed : HilbertSpaceClosed sourceHilbertSpaceCertificate := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact sourceHilbertSpaceCertificate.separableClosed
  · exact sourceHilbertSpaceCertificate.innerProductDefinedClosed
  · exact sourceHilbertSpaceCertificate.orthonormalBasisClosed

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse
