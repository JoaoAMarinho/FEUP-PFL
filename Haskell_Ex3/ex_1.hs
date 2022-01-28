--[f x | x ← xs, p x]
func :: (a -> a) -> (a -> Bool) -> [a] -> [a]
func f p l = map f (filter p l)
