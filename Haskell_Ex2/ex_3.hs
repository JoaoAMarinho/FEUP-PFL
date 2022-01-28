dotprod :: [Float] -> [Float] -> Float
dotprod l1 l2 = sum [ fst x * snd x | x <- zip l1 l2]
