% a) list_append(?L1, ?L2, ?L3)

list_append(L1,L2,L3):- append(L1,L2,L3).

% b) list_member(?Elem, ?List)

list_member(Elem, L):- append(L, [], [Elem|T]).
list_member(Elem, [H|T]):- list_member(Elem, T).