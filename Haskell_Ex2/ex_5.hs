perfeitos :: Integer -> [Integer]
perfeitos x = [ v | v <- [1..x-1], sum (divprop v) == v]

divprop :: Integer -> [Integer]
divprop x = [ divisor | divisor <- [1..x-1], x `mod` divisor == 0 ]
