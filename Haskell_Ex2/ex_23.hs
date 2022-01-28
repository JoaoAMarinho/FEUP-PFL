--Soma de Polinomios
addPoly :: [Int] -> [Int] -> [Int]
addPoly [] [] = []
addPoly (x:xs) [] = [x] ++ xs
addPoly [] (x:xs) = [x] ++ xs
addPoly (x:xs) (y:ys) = [x+y] ++ addPoly xs ys

--Multiplicação de Polinomios
multPoly :: [Int] -> [Int] -> [Int]
multPoly l1 l2 = [ sum [ fst x | x <- auxFunc l1 l2, snd x == h ] | h <- [0..(length l1-1+length l2-1)] ]

auxFunc :: [Int] -> [Int] -> [(Int, Int)]
auxFunc l1 l2 = [ (fst n1 * fst n2, snd n1 + snd n2) | n1 <- zip l1 [0..], n2 <- zip l2 [0..] ]
