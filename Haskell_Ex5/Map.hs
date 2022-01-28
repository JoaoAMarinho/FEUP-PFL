module Map where

data Map k v = Empty -- ^ tabela vazia
             | Node k v (Map k v) (Map k v)

empty :: Map k v
empty = Empty

insert :: Ord k => k -> v -> Map k v -> Map k v
insert x v Empty = Node x v Empty Empty
insert x v (Node y u l r)
  | x == y = Node x v l r
  | x > y = Node y u l (insert x v r)
  | x < y = Node y u (insert x v l) r

lookupMap :: Ord k => k -> Map k v -> Maybe v
lookupMap x Empty = Nothing -- não encontrou
lookupMap x (Node y v l r)
  | x == y = Just v -- encontrou
  | x > y = lookupMap x r
  | x < y = lookupMap x l
