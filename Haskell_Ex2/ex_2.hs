aprox :: Int -> Double
aprox x = 4 * sum [ ((-1)^y)/fromIntegral(2*y+1) | y <- [0..x] ]

aprox' :: Int -> Double
aprox' x = sqrt (12 * sum [ ((-1)^y)/fromIntegral((y+1)^2) | y <- [0..x] ] )
