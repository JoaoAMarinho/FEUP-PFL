% Grupo 1

lig(super, porto).
lig(super, benfica).
lig(super, sporting).
lig(honra, feirense).  
lig(honra, guimaraes).

jog(guimaraes, cleber, de).
jog(feirense, edgar, me).
jog(porto, quaresma, av).
jog(porto, helton, gr).
jog(benfica, simao, av).
jog(sporting, moutinho,me). 
jog(sporting, ricardo, gr).

% 1)

% 1.1) jogadores(+Posicao, -Lista)

jogadores(Posicao, Lista):-
    findall(Jog-Club,
        jog(Club, Jog, Posicao),
        Lista).

% 1.2) calcula(-Lista)

calcula(Lista):-
    get_ligs(Ligas),
    findall(Lig-Clubs,
        (member(Lig, Ligas),
        get_clubs(Lig, Clubs)),
    Lista).

get_ligs(Ligas):-
    setof(Lig,(P)^(
        lig(Lig, P)), 
        Ligas).

get_clubs(Liga, Clubs):-
    findall(Club-Players, 
        (lig(Liga, Club),
        get_players(Club, Players)),
    Clubs).

get_players(Club, Players):-
    findall(Player, jog(Club, Player, _), Players).

% Grupo 2

pessoas([ana, ze, to, rui, ivo]).
conhece(ana, to). 
conhece(ana, ivo).
conhece(ana, ze). 
conhece(ze, ivo).
conhece(to, ivo). 
conhece(to, rui).
conhece(rui, to). 
conhece(rui, ivo).


% 2.1) celebridade(Celeb)

celebridade(Celeb):-
    pessoas(Pessoas),
    findall( [Pessoa|Conhecidos],
        (
            member(Pessoa, Pessoas),
            get_conhecidos(Pessoa, Conhecidos)
        ),
        ListaConhecidos
    ), 
    intersetar_listas(ListaConhecidos, Pessoas, [Celeb|Rest]),
    length(Rest,0).

get_conhecidos(Pessoa, Conhecidos):-
    findall(Conhecido, conhece(Pessoa, Conhecido), Conhecidos).

intersetar_listas([], Res, Res).
intersetar_listas([X|List], Acc, Res):-
    intersetar(X, Acc, Intersection),
    intersetar_listas(List, Intersection, Res).


intersetar([], _, []).
intersetar([X|L1], L2, [X|Res]):-
    member(X, L2),!,
    intersetar(L1, L2, Res).

intersetar([_|L1], L2, Res):-
    intersetar(L1, L2, Res).

% 4

% 4.1) existePadrao(+Str, +Padrao)

existePadrao(Str, Padrao):-
    stateMachine(Str, Padrao, 1).

stateMachine([], Padrao, Index):-
    reachEnd(Padrao, Index).

stateMachine(_, Padrao, Index):-
    reachEnd(Padrao, Index).

stateMachine([Char|Str], Padrao, Index):-
    nth1(Index, Padrao, Trigger),
    (Trigger == 43; Char == Trigger),
    NewIndex is Index +1,!,
    stateMachine(Str, Padrao, NewIndex).
    
stateMachine([Char|Str], Padrao, Index):-
    nth1(1, Padrao, First),
    (First == Char -> NewIndex = 2; NewIndex = 1),
    stateMachine(Str, Padrao, NewIndex).

reachEnd(Padrao, Index):-
    length(Padrao, Lenght),
    Index > Lenght.