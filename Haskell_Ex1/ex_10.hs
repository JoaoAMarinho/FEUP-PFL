imc :: Float -> Float -> String
imc peso altura | x < 18.5 = "baixo peso"
                | x >= 18.5 && x < 25 = "peso normal"
                | x >= 25 && x < 30 = "excesso de peso"
                | x >= 30 = "obesidade"
                where x = peso / (altura^2)
