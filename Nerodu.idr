module Nerodu

import Data.SortedSet
import Data.SortedMap

%default total

data NeroduType = NeroduType_

nspace : SortedMap String NeroduType
nspace = insertFrom
  [ ("Unit", NeroduType_)
  ] empty

data Val = Val_

Value : Type
Value = (Val, NeroduType)
