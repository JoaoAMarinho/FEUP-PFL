module Ex_2 where
import Stack

-- a)
calc :: Stack Float -> String -> Stack Float
calc stk str | str == "+" = push (n2+n1) newStack
             | str == "-" = push (n2-n1) newStack
             | str == "/" = push (n2/n1) newStack
             | str == "*" = push (n2*n1) newStack
             | otherwise = push (read str) stk
             where n1 = top stk
                   n2 = top (pop stk)
                   newStack = pop (pop stk)

-- b)
calcular :: String -> Float
calcular str = top (foldl (\x y ->calc x y) empty (words str))

-- c)
-- main :: IO ()
-- main = do
--          str <- getLine
--          print (calcular str)
