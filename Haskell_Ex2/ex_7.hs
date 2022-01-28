primo :: Integer -> Bool
primo 1 = True
primo x = if length [ divisor | divisor <- [1..x-1], x `mod` divisor == 0 ] == 1 then True
          else False
