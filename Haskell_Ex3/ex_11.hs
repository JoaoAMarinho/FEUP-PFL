calcPi1, calcPi2 :: Int -> Double
calcPi1 x = sum (take x z)
          where z = map (\(x,y)-> x/y) (zip (cycle [4,-4]) ([1,3..]))

calcPi2 x = 3 + sum (take x z)
          where
            z = map (\(x,(a,b,c))-> x/(a*b*c)) (zip (cycle [4,-4]) [(x,x+1,x+2) | x<-[2,4..] ])
