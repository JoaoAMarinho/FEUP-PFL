divprop :: Integer -> [Integer]
divprop x = [ divisor | divisor <- [1..x-1], x `mod` divisor == 0 ]
