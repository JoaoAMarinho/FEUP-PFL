--Condicionais
classifica :: Int -> String
classifica x = if x <= 9 then "reprovado"
               else if x >= 10 && x <=12 then "suficiente"
               else if x >= 13 && x <= 15 then "bom"
               else if x >= 16 && x <= 18 then "muito bom"
               else if x >= 19 && x <= 20 then "muito bom com distinção"
               else "invalid number"

--Guardas
classifica_g :: Int -> String
classifica_g x | x <= 9 = "reprovado"
               | x >= 10 && x <=12 = "suficiente"
               | x >= 13 && x <= 15 = "bom"
               | x >= 16 && x <= 18 = "muito bom"
               | x >= 19 && x <= 20 = "muito bom com distinção"
               | otherwise = "invalid number"
