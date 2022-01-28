% b) del_one(+Elem, +List1, ?List2)

del_one(E, L1):-del_one(E,L1,L2).

del_one(E,[],[]).
del_one(E,[E|T],T).
del_one(E,[H|T],[H|V]):- del_one(E,T,V).

% c) del_all(+Elem, +List1, ?List2)

del_all(E, L1):-del_all(E, L1, L2).

del_all(E, [], []).
del_all(E, [E|T], V):-del_all(E,T,V).
del_all(E, [H|T], [H|V]):- del_all(E,T,V).

% d) del_all_list(+ListElems, +List1, ?List2)

del_all_list([],L1,L1).
del_all_list([H|T], L1, L3):- del_all(H,L1,L2),
                            del_all_list(T,L2, L3).

% e) del_dups(+List1, ?List2)

del_dups([],[]).
del_dups([H|T],[H|L3]):- del_all(H, T, L2),
                     del_dups(L2, L3).
                         