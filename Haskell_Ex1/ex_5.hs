binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..n-k])

binom' :: Integer -> Integer -> Integer
binom' n k | k < diff = product [diff+1..n] `div` product [1..k]
          | otherwise = product [k+1..n] `div` product [1..diff]
          where diff=n-k
