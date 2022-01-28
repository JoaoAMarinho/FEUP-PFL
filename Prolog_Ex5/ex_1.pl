%a
double(X, Y):- Y is X*2. 

map(_, [], []).
map(Pred, [H|L], [X|List2]):-
    Term =.. [Pred, H, X],
    Term,
    map(Pred, L, List2).

%b
sum(A, B, S):- S is A+B.

fold(_, FinalValue, [], FinalValue).

fold(Pred, StartValue, [H|List], FinalValue):-
    Term =.. [Pred, StartValue, H, X],
    Term,
    fold(Pred, X, List, FinalValue).

%c
even(X):- 0 =:= X mod 2.

separate([], _, [], []).
separate([H|List], Pred, [H|Yes], No):-
    Term =.. [Pred, H],
    Term,
    separate(List, Pred, Yes, No).

separate([H|List], Pred, Yes, [H|No]):-
    separate(List, Pred, Yes, No).

%d
ask_execute:-
    write('Insira o que desejar executar:\n'),
    read(X),
    X.

