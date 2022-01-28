% d) inner_product (+List1, +List2, ?Result)

inner_product(List1, List2) :- inner_product(List1, List2, 0).
inner_product([],[],0).
inner_product([X|L1], [Y|L2], Res):-V is X*Y,
                                    inner_product(L1,L2,Res1),
                                    Res is Res1 + V.

% e) count(+Elem, +List, ?N)

count(Elem, List):- count(Elem, List, 0, 0).
count(Elem, List, N):- count(Elem, List, N, 0).

count(Elem, [], N, N).
count(Elem, [Elem | T], N, Ac):-Ac2 is Ac+1,
                                count(Elem, T, N, Ac2).
                                
count(Elem, [H | T], N, Ac):- count(Elem, T, N, Ac).