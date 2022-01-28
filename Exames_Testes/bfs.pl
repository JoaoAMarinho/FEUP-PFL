:- use_module(library(lists)).

connected(porto, lisbon).
connected(lisbon, madrid).
connected(lisbon, paris).
connected(lisbon, porto).
connected(madrid, paris).
connected(madrid, lisbon).
connected(paris, madrid).
connected(paris, belgium).

% procura(lisbon, belgium, Path) ?

procura(Start, End, TruePath):-
    procura([[Start]], End, [], Path),
    reverse(Path, TruePath).

procura([[Fim|Path]|_], Fim, _, [Fim|Path]).

procura([[X|From]|Res], Fim, Visitados, Path):-
    findall([Node,X|From],
        (
            connected(X, Node),
            \+member(Node, Visitados),
            \+member([Node|_], [[X|_]|Res])
        ),
        Nodes),
    append(Res, Nodes, NewNodes),
    procura(NewNodes, Fim, [X|Visitados], Path).
