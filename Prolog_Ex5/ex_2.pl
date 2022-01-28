:- use_module(library(lists)).
:- use_module(library(between)).

% c)
:- op(700, xfx, univ).

% a)
my_arg(A,B,C):-
    A > 0,
    B =.. Term,
    nth0(A, Term, C).

my_functor(A,B,C):-
    var(A),
    length(L, C),
    A =.. [B|L].

my_functor(A,B,C):-
    A =.. [B|L],
    length(L, C).

% b)
univ(X, [Name|Tail]):-
    var(X),
    length(Tail, Size),
    functor(X, Name, Size).

univ(X, [N|L]):-
    functor(X, N, A),
    findall(Arg, (between(1,A, I), arg(I, X, Arg)), L).
