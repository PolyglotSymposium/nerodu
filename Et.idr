module Et

import Nerodu
import Set

%default total

data EtEt : {l : List NeroduType} -> Set l -> Type where
  Unet : EtEt []
  Et : (n : NeroduType) -> (x : NeroduToType n) -> (ee : EtEt {l=l} s) -> {auto prf : NewElem n l} -> EtEt (Conz n s)
