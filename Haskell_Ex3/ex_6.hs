mymdc :: Int -> Int -> Int
mymdc a b = fst (until (\(a,b) -> b == 0) (\(a,b) -> (b,a`mod`b)) (a,b))
