% Grupo 1

objecto(mesa1, vidro).
objecto(cadeira, madeira).
objecto(mesa2, madeira ).
objecto(bigorna, ferro).
objecto(jarra, vidro).
objecto(caixa, madeira).

pesos(mesa1, 10).
pesos(cadeira, 2).
pesos(mesa2, 3).
pesos(bigorna, 20).
pesos(jarra, 0.5).
pesos(caixa, 2.5).

material(vidro, fragil).
material(madeira, forte).
material(ferro, forte).

sobre(cadeira, mesa1).
sobre(mesa2,mesa1). %mesa2 em cima
sobre(bigorna, mesa2).
sobre(jarra, bigorna).
sobre(caixa , jarra). % caixa em cima

% 1.1 a) sobreTipo(+Tipo,-Lista)

/*
sobreTipo(Tipo,Lista):-
    findall(Obj2*sobre*Obj1,
        (objecto(Obj1, Tipo),
        sobre(Obj2, Obj1)),
    Lista).
*/

sobreTipo(T, Lista):- sobreTipo(T, [], Lista), !.

sobreTipo(T, Acc, Res):-
    objecto(X, T),
    sobre(Y, X),
    \+member(Y*sobre*X, Acc),
    sobreTipo(T, [Y*sobre*X| Acc],Res).

sobreTipo(_, Acc, Acc).

% 1.1 b) partem(-ListaObjectos)

partem(ListaObjectos):-
    findall(X-Percent,
        (objecto(X, Mat), 
        material(Mat, fragil),
        pesos(X, Peso), 
        peso_total(X, PesoTot), 
        Percent is (PesoTot/Peso), Percent > 1), 
        ListaObjectos
    ).


peso_total(Obj, PesoTot):-
    findall(Peso,
        (sobre(X, Obj),
        pesos(X, P),
        peso_total(X, PesoT),
        Peso is PesoT + P)
    ,ListaPesos),
    soma(ListaPesos, PesoTot).

soma([], 0).
soma([Peso|L], PesoTotal):-
    soma(L, PesoTot),
    PesoTotal is PesoTot + Peso. 

%  1.2)
membro1(X, [X|Tail]).
membro1(X, [Y|Tail]) :- membro1(X, Tail).

membro2(X, [X|Tail]) :- !.
membro2(X, [Y|Tail]) :- membro2(X, Tail).

% Grupo 2

% 2.2) separa_posit_neg(+Lista, -ListaNeg, -ListaPos)

separa_posit_neg([], [], []).

separa_posit_neg([0|T], ListaNeg, ListaPos):-
    separa_posit_neg(T, ListaNeg, ListaPos).

separa_posit_neg([H|T], [H|ListaNeg], ListaPos):-
    H < 0,
    separa_posit_neg(T, ListaNeg, ListaPos).

separa_posit_neg([H|T], ListaNeg, [H|ListaPos]):-
    H > 0,
    separa_posit_neg(T, ListaNeg, ListaPos).

% 2.3) operadores(-Oper, +Margem1, +Margem2)

get_dir(M1, _, baixo, M):-
    member(barco, M1), get_people(M1, M),!.
get_dir(_, M2, cima, M):-
    member(barco, M2), get_people(M2, M).

get_people([], []).

get_people([barco|M], M).

get_people([H|L], [H|Res]):-
    get_people(L, Res).


get_viajantes(_, [], []):-!.

get_viajantes(X, [X|M], M):-!.

get_viajantes(X, [H|L], [H|Res]):-
    get_viajantes(X, L, Res).

get_condutores([], []).

get_condutores([policia|L], [policia|Res]):-
    get_condutores(L, Res).
get_condutores([pai|L], [pai|Res]):-
    get_condutores(L, Res).
get_condutores([mae|L], [mae|Res]):-
    get_condutores(L, Res).
get_condutores([H|M], Res):-
    get_condutores(M, Res).


operadores(Dir-Par, M1, M2):-
    get_dir(M1, M2, Dir, M),
    get_condutores(M, Cond),
    member(C, Cond),
    Par = [C].

operadores(Dir-Par, M1, M2):-
    get_dir(M1, M2, Dir, M),
    get_condutores(M, Cond),
    member(C, Cond),
    get_viajantes(C, M, Rest),
    member(X, Rest),
    Par = [C,X].
    

invalida(M,_):-
    member(ladrao, M),
    \+member(policia, M).

invalida(_,M):-
    member(ladrao, M),
    \+member(policia, M).

invalida(M,_):-
    member(filha, M),
    member(pai, M),
    \+member(mae, M).

invalida(_,M):-
    member(filha, M),
    member(pai, M),
    \+member(mae, M).

invalida(M,_):-
    member(filho, M),
    member(mae, M),
    \+member(pai, M).
invalida(_,M):-
    member(filho, M),
    member(mae, M),
    \+member(pai, M).

