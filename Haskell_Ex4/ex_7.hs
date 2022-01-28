import Arv

sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No v dir esq) = v + sumArv dir + sumArv esq
