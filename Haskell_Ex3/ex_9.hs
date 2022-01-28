scanlRec :: (b -> a -> b) -> b -> [a] -> [b]
scanlRec f x l = x : aux f x l

aux :: (b -> a -> b) -> b -> [a] -> [b]
aux f bg [] = []
aux f bg (x:xs) = [f bg x] ++ aux f (f bg x) xs
