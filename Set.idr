module Set

%default total

data NewElem : a -> List a -> Type where
  Base : NewElem x []
  Induct : Eq a => {x : a} -> {y : a} -> {auto prf0 : x == y = False} -> {auto prf1 : NewElem x ys} -> NewElem x (y :: ys)

data Set : List a -> Type where
  Nil : Set []
  Conz : Eq a => (x : a) -> Set l -> {auto prf : NewElem x l} -> Set (x :: l)
