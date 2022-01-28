metades :: [x] -> ([x],[x])
--metades [] = ([],[])
metades l = (take size l, drop size l)
            where size = div (length l) 2
