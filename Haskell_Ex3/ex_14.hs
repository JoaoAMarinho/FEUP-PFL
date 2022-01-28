ascii = zip ['A'..'Z'] [0..]

cifraChave :: String -> String -> String
cifraChave str1 str2 = intListToStr (zipWith (\ x y -> (x + y)`mod`(length ascii)) l1 l2)
                       where l1 = strToIntList str1
                             l2 = cycle (strToIntList str2)

intListToStr :: [Int] -> String
intListToStr l = map (\x -> fst((!!) ascii x)) l

strToIntList :: String -> [Int]
strToIntList str = foldl (\ x y -> x++[snd(head (filter (\(a,b)->a==y) ascii))] ) [] str
