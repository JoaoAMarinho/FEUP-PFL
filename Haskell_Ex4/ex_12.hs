import Arv

-- a)
maisDir :: Arv a -> a
maisDir Vazia = error "Invalid Tree"
maisDir (No x _ Vazia) = x
maisDir (No _ _ dir) = maisDir dir

maisEsq :: Arv a -> a
maisEsq (No x Vazia _) = x
maisEsq (No _ esq _) = maisEsq esq

-- b)
remover :: Ord a => a -> Arv a -> Arv a
remover x Vazia = Vazia
remover x (No y Vazia dir) | x==y = dir
remover x (No y esq Vazia) | x==y = esq
remover x (No y esq dir)   | x<y = No y (remover x esq) dir
                           | x>y = No y esq (remover x dir)
                           | x==y = let z = maisEsq dir
                                    in No z esq (remover z dir)

remover' :: Ord a => a -> Arv a -> Arv a
remover' x Vazia = Vazia
remover' x (No y Vazia dir) | x==y = dir
remover' x (No y esq Vazia) | x==y = esq
remover' x (No y esq dir)   | x<y = No y (remover' x esq) dir
                            | x>y = No y esq (remover' x dir)
                            | x==y = let z = maisDir esq
                                     in No z (remover' z esq) dir
