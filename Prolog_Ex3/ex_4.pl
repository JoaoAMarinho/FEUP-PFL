:-use_module(library(between)).

% a) print_n(+S, +N).
print_n(_, 0).
print_n(S, N):-
    N > 0,
    write(S),
    N1 is N-1,
    print_n(S, N1).

% b) print_text(+Text, +Symbol, +Padding).
print_text(Text, Symbol, Padding):-
    write(Symbol),
    print_n(' ', Padding),
    printStr(Text),
    print_n(' ', Padding),
    write(Symbol).

printStr([Char|[]]):-
    put_code(Char).
printStr([Char|Text]):-
    put_code(Char),
    printStr(Text).

% d) read_number(-X).
read_number(X):-read_number(X, "0").

read_number(X, L):-
    peek_code(10),
    !,skip_line,
    reverse(L, L1),
    number_codes(X, L1).

read_number(X, L):-
    get_code(V),
    between(47, 58, V),!,
    read_number(X, [V|L]).

read_number(X, L):- read_number(X, L).

% e) read_until_between(+Min, +Max, -Value).
read_until_between(Min, Max, Value):-
    repeat,
    read_number(X),
    between(Min, Max, X).

% i) oh_christmas_tree(+N).
oh_christmas_tree(N):-
    N >= 1,
    oh_christmas_tree(N, 0),!,
    Padding is N-1,
    printLine(Padding, 1).

oh_christmas_tree(N, N).

oh_christmas_tree(N, V):-
    NewV is V+1,
    TotalStars is NewV*2-1,
    Padding is N-NewV,
    printLine(Padding, TotalStars),nl,
    oh_christmas_tree(N, NewV).

printLine(Padding, TotalStars):-
    print_n(' ', Padding),
    print_n('*', TotalStars),
    print_n(' ', Padding).

% j) print Ninja from file
ninja:- 
    open('D:/Escola/Faculdade/3_Ano/1_Semestre/PFL/Prolog_Ex3/ninja.txt', read, Str),
    read_file(Str),
    close(Str),
    nl.
read_file(Stream) :-
    peek_code(Stream,-1).

read_file(Stream) :-
    get_char(Stream, X),
    write(X),
    read_file(Stream).
