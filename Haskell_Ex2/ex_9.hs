import Data.Char (ord, isAlpha)
cifrar :: Int -> String -> String
cifrar k str = [ if (isAlpha c) then ((!!) ascii ((ord c - ord 'A' + k) `mod` length ascii)) else c | c <- str]

ascii :: String
ascii = ['A'..'Z']
