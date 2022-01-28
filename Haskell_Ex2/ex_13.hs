-- a)
mindiv :: Int -> Int
mindiv v = if length l >= 1 then head l
           else 0
           where l = [x | x<-[2..round(sqrt(fromIntegral v))], v `mod` x == 0]

-- b)
isPrime :: Int -> Bool
isPrime x = (x > 1) && (mindiv x == 0)
