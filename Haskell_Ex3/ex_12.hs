module Ex_12(intercalar) where

intercalar :: a -> [a] -> [[a]]
intercalar x [] = [[x]]
intercalar x xs = aux 0 x xs

aux :: Int -> a -> [a] -> [[a]]
aux i x xs | i > length xs = []
           | otherwise = [(insertAt x i xs)] ++ (aux (i+1) x xs)

insertAt :: a -> Int -> [a] -> [a]
insertAt newElement 0 as = newElement:as
insertAt newElement i (a:as) = a : insertAt newElement (i - 1) as
