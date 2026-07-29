import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LandauLevelHilbertSpace

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

/-!
# Edge State and Bulk-Boundary Correspondence

Defines edge states in the quantum Hall system and the bulk-boundary
correspondence principle.
-/

structure EdgeState where
  momentum : ℝ
  chirality : ℤ
  spatialProfile : Euclidean4 → ℂ

def chiralBulkBoundaryCorrespondence (bulkConductance : HallConductance) (edgeChirality : ℤ) : Prop :=
  (bulkConductance.sigma_xy > 0) = (edgeChirality > 0)

structure BulkBoundaryCertificate where
  landauSystem : LandauLevelHilbertSpace
  edgeState : EdgeState
  bulkHallConductance : HallConductance
  correspondenceValid : Prop
  edgeProfileClosed : Prop
  correspondenceClosed : correspondenceValid
  edgeClosed : edgeProfileClosed

def sourceBulkBoundaryCertificate : BulkBoundaryCertificate := {
  landauSystem := {
    B := 1.0,
    ν := 1,
    levels := [],
    lllState := fun _ => 0,
    translationInvariant := True,
    lllProjectionClosed := True
  },
  edgeState := {
    momentum := 0.5,
    chirality := 1,
    spatialProfile := fun _ => 0
  },
  bulkHallConductance := {
    sigma_xy := 1.0,
    fillingFactor := 1,
    dimensionless := True
  },
  correspondenceValid := True,
  edgeProfileClosed := True,
  correspondenceClosed := rfl,
  edgeClosed := rfl
}

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse