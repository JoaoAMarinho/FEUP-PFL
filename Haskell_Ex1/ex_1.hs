testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = if(a + b <= c || a + c <= b || b + c <= a) then False else True
