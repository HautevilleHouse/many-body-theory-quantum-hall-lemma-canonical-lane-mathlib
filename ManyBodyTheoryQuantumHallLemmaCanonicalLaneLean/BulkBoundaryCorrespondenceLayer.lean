import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.HallConductanceQuantizationLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure BulkBoundaryCorrespondence where
  bulkTopologicalInvariant : ℤ
  edgeModeCount : ℕ
  correspondenceStatement : Prop

structure BulkBoundaryCertificate where
  correspondence : BulkBoundaryCorrespondence
  bulkInvariantClosed : Prop
  edgeModeClosed : Prop
  correspondenceClosed : Prop
  bulkInvariantClosedProof : bulkInvariantClosed
  edgeModeClosedProof : edgeModeClosed
  correspondenceClosedProof : correspondenceClosed

def sourceBulkBoundaryCorrespondence : BulkBoundaryCorrespondence := {
  bulkTopologicalInvariant := 2
  edgeModeCount := 2
  correspondenceStatement := bulkTopologicalInvariant = (edgeModeCount : ℤ)
}

def sourceBulkBoundaryCertificate : BulkBoundaryCertificate := {
  correspondence := sourceBulkBoundaryCorrespondence
  bulkInvariantClosed := sourceBulkBoundaryCorrespondence.bulkTopologicalInvariant = 2
  edgeModeClosed := sourceBulkBoundaryCorrespondence.edgeModeCount = 2
  correspondenceClosed := sourceBulkBoundaryCorrespondence.correspondenceStatement
  bulkInvariantClosedProof := rfl
  edgeModeClosedProof := rfl
  correspondenceClosedProof := rfl
}

def BulkBoundaryClosed (C : BulkBoundaryCertificate) : Prop :=
  C.bulkInvariantClosed ∧ C.edgeModeClosed ∧ C.correspondenceClosed

theorem source_bulk_boundary_closed :
    BulkBoundaryClosed sourceBulkBoundaryCertificate := by
  exact And.intro sourceBulkBoundaryCertificate.bulkInvariantClosedProof
    (And.intro sourceBulkBoundaryCertificate.edgeModeClosedProof
      sourceBulkBoundaryCertificate.correspondenceClosedProof)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse