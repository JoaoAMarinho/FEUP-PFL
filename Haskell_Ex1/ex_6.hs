raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = let x1 = (-b + sqrt bd) / (2*a)
                   x2 = (-b - sqrt bd) / (2*a)
               in (x1,x2)
               where bd = b^2-4*a*c
