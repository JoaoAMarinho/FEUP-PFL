-- Concat
myconcat'' :: [[a]] -> [a]
myconcat'' l = [y | x <- l, y <- x]

-- Replicate
myreplicate' :: Int -> a -> [a]
myreplicate' i v = [v | x<-[0..i-1]]

-- Select
select'' :: [a] -> Int -> a
select'' l index = head [ x | (x,i) <- zip l [0..],  i == index]
