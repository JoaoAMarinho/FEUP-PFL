-- a)
merge :: Ord a => [a] -> [a] -> [a]
merge l [] = l
merge [] l = l
merge (x:xs) (y:ys) | x <= y = [x] ++ merge xs (y:ys)
                    | otherwise = [y] ++ merge (x:xs) ys

-- b)
msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort l = merge (fst x) (snd x) where x = metades l

metades :: [a] -> ([a],[a])
metades l = (take i l, drop i l) where i = length l `div` 2
