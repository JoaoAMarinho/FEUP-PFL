myinsert :: Ord a => a -> [a] -> [a]
myinsert n [] = [n]
myinsert n (x:xs) | x > n = [n] ++ [x] ++ xs
                  | otherwise = [x] ++ myinsert n xs
