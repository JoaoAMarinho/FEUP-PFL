mediana_a :: Ord a => a -> a -> a -> a
mediana_a a b c = if x==a && y==b then c
                  else if x==a && y==c then b
                  else if x==b && y==c then a
                  else if x==b && y==a then c
                  else if x==c && y==a then b
                  else a
                  where x = max (max a b) c
                        y = min (min a b) c

mediana_b :: (Num a,Ord a) => a -> a -> a -> a
mediana_b a b c = soma - maior - menor
                  where soma = a+b+c
                        maior = max (max a b) c
                        menor = min (min a b) c
