module Set

%access public export
%default total

data NewElem : a -> List a -> Type where
  Base : NewElem x []
  Induct : Eq a => {x : a} -> {y : a} -> {auto prf0 : x == y = False} -> {auto prf1 : NewElem x ys} -> NewElem x (y :: ys)

data Set : List a -> Type where
  Nil : Set []
  Conz : Eq a => (x : a) -> Set l -> {auto prf : NewElem x l} -> Set (x :: l)

data Elem : a -> (l : List a) -> Set l -> Type where
  InHead : Eq a => (x : a) -> (s : Set l) -> {auto prf: NewElem x l} -> Elem x (x :: l) (Conz x s)
  InTail : Eq a => (x : a) -> (y : a) -> (e : Elem x l s) -> {auto prf: NewElem y l} -> Elem x (y :: l) (Conz y s)
