-- Minimum
myminimum :: Ord a => [a] -> a
myminimum [x] = x
myminimum (x:xs) = if x > (head xs) then myminimum xs
                   else myminimum ([x]++tail xs)

-- Delete
mydelete :: Eq a => a -> [a] -> [a]
mydelete a [] = []
mydelete v (x:xs) = if v == x then xs
                    else [x] ++ mydelete v xs

-- Selection sort
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort l = [m] ++ ssort (mydelete m l)
          where m = myminimum l
