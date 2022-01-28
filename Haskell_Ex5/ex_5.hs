import Set

union, intersect, difference ::  Ord a => Set a -> Set a -> Set a

union set Empty = set
union Empty set = set
union set1 set2 = foldl (\x y ->insert y x) set1 (toList set2)

intersect set Empty = Empty
intersect Empty set = Empty
intersect set1 set2 = foldl (\x y -> if (member y set1) then insert y x else x) Empty (toList set2)

difference set Empty = set
difference Empty set = Empty
difference set1 set2 = foldl (\x y -> if not (member y set2) then insert y x else x) Empty (toList set1)
