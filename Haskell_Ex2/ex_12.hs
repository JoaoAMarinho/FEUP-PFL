import Data.Char

forte :: String -> Bool
forte str = (length str >= 8) && (or [if isUpper x then True else False | x<-str])
                              && (or [if isLower x then True else False | x<-str])
                              && (or [if isDigit x then True else False | x<-str])

forte' :: String -> Bool
forte' str = (length str >= 8) && (any isUpper str) && (any isLower str) && (any isDigit str)
