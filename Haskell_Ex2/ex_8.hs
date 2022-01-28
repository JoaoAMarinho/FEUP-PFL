pascal :: Integer -> [[Integer]]
pascal n = [ [binom x y | y <- [0..x]] | x <- [0..n] ]

binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..n-k])
