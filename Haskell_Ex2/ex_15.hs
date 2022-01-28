myintersperse :: a -> [a] -> [a]
myintersperse x [] = []
myintersperse x (y:ys) = [y, x] ++ myintersperse x ys  
