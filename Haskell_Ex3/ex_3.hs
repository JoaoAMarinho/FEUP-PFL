zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f xs ys = map (\(a,b) -> f a b) (zip xs ys)
