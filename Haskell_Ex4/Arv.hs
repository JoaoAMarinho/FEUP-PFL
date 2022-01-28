module Arv where

data Arv a = Vazia | No a (Arv a) (Arv a) deriving (Show)

listarArv :: Arv a -> [a]
listarArv Vazia = []
listarArv (No x esq dir) = listarArv esq ++ [x] ++ listarArv dir

inserir :: Ord a => a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No y esq dir) | x==y = No y esq dir
                         | x<y = No y (inserir x esq) dir
                         | x>y = No y esq (inserir x dir)

construir :: Ord a => [a] -> Arv a
construir [] = Vazia
construir (x:xs) = inserir x (construir xs)

construirBn :: [a] -> Arv a
construirBn [] = Vazia
construirBn xs = No x (construirBn y) (construirBn z)
                 where n = length xs`div`2 -- ponto médio
                       y = take n xs -- partir a lista
                       x:z = drop n xs

getArv :: Num a => Arv a
getArv = (No 11 (No 3 (No 2 Vazia Vazia) (No 5 Vazia Vazia)) (No 19 (No 13 Vazia Vazia) (No 23 Vazia Vazia)))
