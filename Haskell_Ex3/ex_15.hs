binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..n-k])

-- a)
lista_infinita_pascal1 :: [[Int]]
lista_infinita_pascal1 = [ [fromInteger(binom n k) | k<-[0..n] ]| n<-[1..]]

-- b)
lista_infinita_pascal2 :: [[Int]]
lista_infinita_pascal2 = [[1]]++[ [if (k==0 || n==k) then 1 else ( (!!) ((!!) lista_infinita_pascal2 (n-1)) (k-1) + (!!) ((!!) lista_infinita_pascal2 (n-1)) (k) ) | k<-[0..n] ]| n<-[1..]]
