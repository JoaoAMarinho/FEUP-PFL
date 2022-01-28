--And
myand :: [Bool] -> Bool
myand [] = True
myand (x:xs) = x && myand' xs

myand' :: [Bool] -> Bool
myand' l = all (\x -> x) l

--Or
myor :: [Bool] -> Bool
myor [] = False
myor (x:xs) = x || myor' xs

myor' :: [Bool] -> Bool
myor' l = any (\x -> x) l

--Concat
myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat(xs)

myconcat' :: [[a]] -> [a]
myconcat' (x:xs) = foldl (++) x xs

-- Replicate
myreplicate :: Int -> a -> [a]
myreplicate 0 a = []
myreplicate 1 a = [a]
myreplicate n a = [a] ++ myreplicate (n-1) a

-- (!!)
select :: [a] -> Int -> a
select l 0 = head l
select (_:xs) n = select xs (n-1)

select' :: [a] -> Int -> a
select' l index = head [ x | (x,i) <- zip l [0..],  i == index]
--select' l index = fst(head (filter (\x -> snd x == index) (zip l [0..])))

-- Elem
myelem :: Eq a => a -> [a] -> Bool
myelem a [] = False
myelem a (x:xs) = a == x || myelem a xs

myelem' :: Eq a => a -> [a] -> Bool
myelem' a l = any (\x -> x==a) l
