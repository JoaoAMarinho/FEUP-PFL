import Arv

-- a)
calcHeightBn :: Arv a -> Integer
calcHeightBn arv | (nElems arv)==0 = 0
                 | otherwise = fromIntegral(floor(logBase 2 (nElems arv)))


nElems :: Arv a -> Float
nElems Vazia = 0.0
nElems (No x esq dir) = nElems esq + 1.0 + nElems dir

-- b)
calcHeight :: Arv a -> Integer
calcHeight Vazia = 0
calcHeight (No x Vazia Vazia) = 0
calcHeight (No x esq dir) = 1 + max (calcHeight esq) (calcHeight dir)
