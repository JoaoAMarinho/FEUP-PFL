mynub :: Eq a => [a] -> [a]
mynub [] = []
mynub (x:xs) = [x] ++ mynub([y | y <- xs, y /=x ])
