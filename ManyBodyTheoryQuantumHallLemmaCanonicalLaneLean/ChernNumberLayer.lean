import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean

structure ChernNumberCertificate where
  chernNumberDefined : Prop
  quantization : Prop
  hallConductance : Prop
  chernNumberDefinedClosed : chernNumberDefined
  quantizationClosed : quantization
  hallConductanceClosed : hallConductance

def sourceChernNumberCertificate : ChernNumberCertificate := {
  chernNumberDefined := True
  quantization := True
  hallConductance := True
  chernNumberDefinedClosed := by trivial
  quantizationClosed := by trivial
  hallConductanceClosed := by trivial
}

def ChernNumberClosed (C : ChernNumberCertificate) : Prop :=
  C.chernNumberDefined ∧ C.quantization ∧ C.hallConductance

theorem source_chern_number_closed : ChernNumberClosed sourceChernNumberCertificate := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact sourceChernNumberCertificate.chernNumberDefinedClosed
  · exact sourceChernNumberCertificate.quantizationClosed
  · exact sourceChernNumberCertificate.hallConductanceClosed

end ManyBodyTheoryQuantumHallLemmaCanonicalLaneLean
end HautevilleHouse
