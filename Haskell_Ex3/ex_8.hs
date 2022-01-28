--a)
import Data.Char (isSpace)
palavras :: String -> [String]
palavras "" = []
--palavras str = filter (\x -> x/="") (foldl (\x y -> if (isSpace y) then x ++ [""]
--                                      else (init x)++[(last x)++[y]]) [] str)
palavras l = (if v/=[""] then v else []) ++ palavras(dropWhile isSpace (dropWhile (\x->not (isSpace x)) l))
             where v = [takeWhile (\x->not (isSpace x)) l]

--b)
despalavras :: [String] -> String
despalavras [a] = a
despalavras (x:xs) = foldl (\x y -> x ++ " " ++ y) x xs
