module Main where
import Ex_2

main :: IO ()
main = do
         str <- getLine
         print (calcular str)
