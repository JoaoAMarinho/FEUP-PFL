myalgarismos :: Int -> [Int]
myalgarismos x = reverse (algarismosRev x)

algarismosRev :: Int -> [Int]
algarismosRev 0 = []
algarismosRev x = [x `mod` 10] ++ algarismosRev (x `div` 10) 
