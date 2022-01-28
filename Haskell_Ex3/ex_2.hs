dec2int :: [Int] -> Int
dec2int (x:xs) = foldl (\x y -> x*10 + y) x xs
