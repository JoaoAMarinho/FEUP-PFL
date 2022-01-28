import Arv

listar :: Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar dir ++ [x] ++ listar esq
