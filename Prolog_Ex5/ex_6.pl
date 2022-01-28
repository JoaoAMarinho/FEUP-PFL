% a) Element exists_in List

:-op(550, xfx, exists_in).

exists_in(X, L):- member(X, L).

% b) append A to B results C

:-op(600, yfx, results).
:-op(550, yfx, to).

results(X, Res):- 
    X =.. List,
    append(List, [Res], TermList),
    Term =.. TermList,
    Term.

to(X, Y, Res):- 
    append([X], [Y], TermList1),
    append(TermList1, [Res], TermList2),
    Term =.. TermList2,
    Term.

% c) remove Elem from List results Result