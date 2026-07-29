import ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse