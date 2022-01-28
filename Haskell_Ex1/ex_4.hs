--Alínea A
last_1 :: [x] -> x
last_1 = head . reverse

last_2 :: [x] -> x
last_2 l = head (drop (length l-1) l)

--Alínea B
init_1 :: [x] -> [x]
init_1 l = reverse (tail (reverse l))

init_2 :: [x] -> [x]
init_2 l = take (length l - 1) l
