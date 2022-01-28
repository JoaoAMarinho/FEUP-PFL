primos :: [Int]
primos = crivo [2..]

crivo :: [Int] -> [Int]
crivo (p:xs) = p : crivo [x | x<-xs, x`mod`p/=0]

factores :: Int -> [Int]
factores 1 = []
factores x = dv : factores (x`div`dv)
            where dv = head (filter (\v->(x`mod`v)==0) primos)
