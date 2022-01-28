segundo :: [a] -> a
segundo xs = head (tail xs)

trocar :: (a,b) -> (b,a)
trocar (x, y) = (y, x)

par :: a -> b -> (a, b)
par x y = (x, y)

dobro :: Num x => x -> x
dobro x = 2 * x

metade :: Fractional x => x -> x
metade x = x/2

minuscula :: Char -> Bool
minuscula x = x >= 'a' && x <= 'z'

intervalo :: Ord x => x -> x -> x -> Bool
intervalo x a b = x >= a && x <= b

palindromo :: Eq x => [x] -> Bool
palindromo xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)
