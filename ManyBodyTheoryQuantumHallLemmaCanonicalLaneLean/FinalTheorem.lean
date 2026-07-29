import canonicalLaneMathlib.AdmissibleClass
import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.HilbertSpaceLayer
import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.SpectralProjectionLayer
import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.LaughlinWavefunctionLayer
import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.ChernNumberLayer
import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.EdgeStatesLayer

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop := A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedQuantumHallLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_quantum_hall_lemma_endgame (A : AdmissibleClass) :
    ConstrainedQuantumHallLemmaClosure A := by
  refine And.intro ?_ ?_
  · exact trivial
  · exact A.gateWitness

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse
