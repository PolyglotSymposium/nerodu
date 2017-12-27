module Nerodu

%access public export
%default total

data NeroduType
  = NTInt
  | NTString
  | NTBool

neroduTypeN : NeroduType -> Nat
neroduTypeN NTInt = 0
neroduTypeN NTString = 1
neroduTypeN NTBool = 2

NeroduToType : NeroduType -> Type
NeroduToType NTInt = Int
NeroduToType NTString = String
NeroduToType NTBool = Bool

implementation Eq NeroduType where
  nt1 == nt2 = neroduTypeN nt1 == neroduTypeN nt2

implementation Ord NeroduType where
  compare nt1 nt2 = compare (neroduTypeN nt1) (neroduTypeN nt2)

