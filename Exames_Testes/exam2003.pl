% Grupo 1

% 1)remove_todos(+X, ?Lista, ?Nova)

remove_todos(_, [], []).

remove_todos(X, V, V):-
    \+member(X, V), !. 
remove_todos(X, L, V):-
    var(L),
    member(X, V), !, fail.

remove_todos(X, [X | Res], Nova):-
    remove_todos(X, Res, Nova), !.

remove_todos(X, [V | Res], [V|Nova]):-
    remove_todos(X, Res, Nova).

% 2)extremos(+Lista, -Maximo, -Minimo)

extremos([H], H, H):-!.
extremos([H|L], Max, Min):-
    extremos(L, H, H, Max, Min).

extremos([], Max, Min, Max, Min).

extremos([H|L], X, Y, Max, Min):-
    max(H, X, X2),
    min(H, Y, Y2),
    extremos(L, X2, Y2, Max, Min).

max(X, Y, X) :- X >= Y, !.
max(X, Y, Y).
min(X, Y, X) :- X =< Y, !.
min(X, Y, Y).

% 3)
europa(lisboa, portugal, capital, 900).
europa(porto, portugal, cidade, 300).
europa(madrid, espanha, capital, 3100).
europa(barcelona, espanha, cidade, 2900).
europa(espinho, portugal, cidade, 40).
europa(gaia, portugal, cidade, 260).
europa(arcozelo, portugal, vila, 15).
europa(coimbra, portugal, cidade, 105).

% a) cidades_grandes(+Pais, -Lista, -Pop_Total)

cidades_grandes(Pais, Lista, Pop_Total):-
    findall((Nome,Pop), ( 
        europa(Nome, Pais, Tipo, Pop),
        Tipo \= capital, Pop >= 100
    ), Lista),
    sum_list(Lista, Pop_Total).

sum_list([(_,P)], P).
sum_list([(_,H)|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.

% b) capitais(-Lista_Capitais).

capitais(Res):-
    findall((Nome*Size), ( 
        europa(Nome, Pais, capital, _),
        findall( _V, (europa(_, Pais, Tipo, _), Tipo\=vila), L),
        length(L, Size)
    ), Res).

% Grupo 2

tabuleiro( [ (1,3,o),(1,4,o),(1,5,o),(2,3,o),(2,4,o),(2,5,o),
(3,1,o),(3,2,o),(3,3,o),(3,4,o),(3,5,o),(3,6,o),(3,7,o),
(4,1,o),(4,2,o),(4,3,o),(4,4,x),(4,5,o),(4,6,o),(4,7,o),
(5,1,o),(5,2,o),(5,3,o),(5,4,o),(5,5,o),(5,6,o),(5,7,o),
(6,3,o),(6,4,o),(6,5,o),(7,3,o),(7,4,o),(7,5,o) ] ).

escreve(o):- write('o').
escreve(x):- write('.').
escreve(n):- write('#').

board_value(Y, X, Tab, Val):-
    member((Y,X,Val), Tab), !.
board_value(_, _, _, n).

% 1) mostra_tab(+Tab)

mostra_tab(Tab):-
    write('    1 2 3 4 5 6 7'), nl,
    write('  # # # # # # # # #'), nl,
    print_lines(1, Tab),
    write('  # # # # # # # # #'), nl,
    write('    1 2 3 4 5 6 7'), nl.

print_lines(8, _).
print_lines(X, Tab):-
    write(X), write(' #'),
    print_line(X, 1, Tab),
    write(' # '), write(X), nl,
    NewX is X+1,
    print_lines(NewX, Tab).

print_line(_,8, _).
print_line(Y, X, Tab):-
    write(' '),
    board_value(Y,X,Tab, Val),
    escreve(Val),
    NewX is X+1,
    print_line(Y, NewX, Tab).

% 2) vizinho(+Tab, ?Xi, ?Yi, ?Xf, ?Yf, ?Direc)

vizinho(Tab, Xi, Yi, Xf, Yi, Dir):-
    dir(Xi,Yi,Xf,Yf,Dir),
    member((Yi,Xi,_), Tab),
    member((Yf,Xf,_), Tab).

dir(Xi,Yi,Xf,Yf,dir):- nonvar(Xi), Xf is Xi + 1.
dir(Xi,Yi,Xf,Yf,esq):- nonvar(Xi), Xf is Xi - 1.
dir(Xi,Yi,Xf,Yf,cim):- nonvar(Yi), Yf is Yi + 1.
dir(Xi,Yi,Xf,Yf,bai):- nonvar(Yi), Yf is Yi - 1.

dir(Xi,Yi,Xf,Yf,dir):- nonvar(Xf), Xi is Xf - 1.
dir(Xi,Yi,Xf,Yf,esq):- nonvar(Xf), Xi is Xf + 1.
dir(Xi,Yi,Xf,Yf,cim):- nonvar(Yf), Yi is Yf - 1.
dir(Xi,Yi,Xf,Yf,bai):- nonvar(Yf), Yi is Yf + 1.

% 3) 
% jogada_valida(+Tab, ?Lini/Coli, ?Linf/Colf)
% executa_jogada(+Tab, +Lini/Coli, +Linf/Colf, -NovoTab)

resolve_solitario(Tab, []):-
    game_over(Tab).

resolve_solitario(Tab, [(Xi/Yi-Xf/Yf)|List]):-
    jogada_valida(Tab, Yi/Xi, Yf/Xf),
    executa_jogada(Tab, Yi/Xi, Yf/Xf, NovoTab),
    resolve_solitario(NovoTab, List).

game_over(Tab):-
    member((X,Y,o), Tab),
    (X\=4; Y\=4), !, fail.
game_over(_).