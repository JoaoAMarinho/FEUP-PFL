--a)
maximuml, minimuml :: Ord a => [a] -> a
maximuml l = foldl1 max l
minimuml l = foldl1 min l

maximumr, minimumr :: Ord a => [a] -> a
maximumr l = foldr1 max l
minimumr l = foldr1 min l

--b)
myfoldl1, myfoldr1 :: (a -> a -> a) -> [a] -> a
myfoldl1 f l = foldl f (head l) (tail l)
myfoldr1 f l = foldr f (last l) (init l)
