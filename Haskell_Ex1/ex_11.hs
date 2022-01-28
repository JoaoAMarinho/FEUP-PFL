max3, min3 :: Ord a => a -> a -> a -> a
max3 x y z = let m1 = max x y
             in max m1 z
min3 x y z = let m1 = min x y
             in min m1 z
