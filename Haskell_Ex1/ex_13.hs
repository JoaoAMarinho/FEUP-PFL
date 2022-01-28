safetail_p :: [a] -> [a]
safetail_p [] = []
safetail_p l = tail l

safetail_g :: [a] -> [a]
safetail_g l | length l == 0 = []
             | otherwise = tail l
