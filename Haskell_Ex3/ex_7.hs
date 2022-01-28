-- (++)
junta :: [a] -> [a] -> [a]
junta a b = foldr (:) b a

-- concat
concatena :: [[a]] -> [a]
concatena l = foldr (++) [] l

-- reverse
reverter :: [a] -> [a]
reverter l = foldr (\x y -> y++[x]) [] l

revertel :: [a] -> [a]
revertel l = foldl (\x y -> y:x) [] l

-- elem
existe :: Eq a => a -> [a] -> Bool
existe a l = any (a==) l
