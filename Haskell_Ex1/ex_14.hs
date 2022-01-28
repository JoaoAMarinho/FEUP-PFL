curta_a :: [a] -> Bool
curta_a l | (x==0 || x==1 || x==2) = True
          | otherwise = False
          where x = length l

curta_b :: [a] -> Bool
curta_b [] = True
curta_b [a] = True
curta_b [a,b] = True
curta_b l = False
