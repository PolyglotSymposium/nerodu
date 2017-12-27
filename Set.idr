module Set

%access public export
%default total

data NewElem : a -> List a -> Type where
  Base : NewElem x []
  Induct : Eq a => {x : a} -> {y : a} -> {auto prf0 : x == y = False} -> {auto prf1 : NewElem x ys} -> NewElem x (y :: ys)

data Set : List a -> Type where
  Nil : Set []
  Conz : Ord a => (x : a) -> Set l -> {auto prf : NewElem x l} -> Set (sort (x :: l))

data Elem : a -> {l : List a} -> Set l -> Type where
  InHead : Ord a => (x : a) -> (s : Set l) -> {auto prf: NewElem x l} -> Elem x (Conz x s)
  InTail : Ord a => (x : a) -> (y : a) -> {s : Set l} -> (e : Elem x s) -> {auto prf: NewElem y l} -> Elem x (Conz y s)
