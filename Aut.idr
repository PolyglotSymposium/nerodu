module Aut

import Nerodu
import Set

%default total

data Aut : {l : List NeroduType} -> Set l -> Type where
  Hoc : (n : NeroduType) -> (x : NeroduToType n) -> {l : List NeroduType} -> {s : Set l} -> {auto prf : Elem n l s} -> Aut s

