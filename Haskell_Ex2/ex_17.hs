toBits :: Int -> [Int]
toBits 1 = [1]
toBits x = toBits (x `div` 2) ++ [x `mod` 2]
