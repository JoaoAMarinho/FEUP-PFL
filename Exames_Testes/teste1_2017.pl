:- dynamic played/4.

%player(Name, UserName, Age)
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).

%game(Name, Categories, MinAge)
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16).
game('Duas Botas', [action, free, strategy, moba], 16).

%played(Player, Game, HoursPlayed, PercentUnlocked)
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player',  'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).

% 1)

achievedALot(P):-
    played(P, _, _, X), X>=80.

% 2)

isAgeAppropriate(N, G):-
    player(N, _, A),
    game(G, _, V),
    A >= V.

% 3)

timePlayingGames(P, Games, ListOfTimes, SumTimes):-
    timePlayingGames(P, Games, ListOfTimes, 0, SumTimes).

timePlayingGames(_, [], [], Acc, Acc).

timePlayingGames(P, [Game|Rest], [H|ListOfTimes], Acc, SumTimes):-
    played(P, Game, H, _),
    NewAcc is Acc + H,
    timePlayingGames(P, Rest, ListOfTimes, NewAcc, SumTimes).

timePlayingGames(P, [_|Rest], [0|ListOfTimes], Acc, SumTimes):-
    timePlayingGames(P, Rest, ListOfTimes, Acc, SumTimes).

% 4)

listGamesOfCategory(Cat):-
    game(X, Categories, Age),
    member(Cat, Categories),
    write(X), write(' '), write('('), write(Age),write(')'), nl,
    fail.

listGamesOfCategory(_).

% 5)

updatePlayer(Player, Game, NewHours, NewPercentage):-
    played(Player, Game, Hours, Percentage),
    SumHours is Hours + NewHours,
    SumPercentage is Percentage + NewPercentage,
    Term =.. [played, Player, Game, Hours, Percentage],
    retract(Term),
    Newterm =.. [played, Player, Game, SumHours, SumPercentage],
    assertz(Newterm).

% 6)

fewHours(P, Games):-
    fewHours(P, Games, []).

fewHours(P, Games, Acc):-
    played(P, G, H ,_),
    H < 10,
    \+member(G, Acc), !,
    fewHours(P, Games, [G|Acc]).

fewHours(_, Games, Games).

% 7)

ageRange(MinAge, MaxAge, Players):-
    ageRange(MinAge, MaxAge, Players, []).

ageRange(MinAge, MaxAge, Players, Acc):-
    player(Name, _, Age),
    Age >= MinAge, Age =< MaxAge,
    \+member(Name, Acc), !,
    ageRange(MinAge, MaxAge, Players, [Name|Acc]).

ageRange(_, _, Players, Players).

% 8)

averageAge(Game, Avg):-
    averageAge(Game, Avg, []).

averageAge(Game, Avg, Acc):-
    player(Name, User, Age),
    played(User, Game, _, _),
    \+member(Name, Acc), !,
    averageAge(Game, Avg, [Name|Acc]).

averageAge(_, Avg, List):-
    soma(List, V),
    length(List, L),
    Avg is V / L.

soma([], 0).

soma([X|L], V):-
    player(X, _, Age),
    soma(L, V2),
    V is V2 + Age.

% 9)

mostEffectivePlayers(G, Players):-
    mostEffectivePlayers(G, Players, []).

mostEffectivePlayers(G, Players, Acc):-
    played(Name, G, H, Percentage),
    Efficiency is Percentage / H,
    \+member(Name-Efficiency, Acc), !,
    mostEffectivePlayers(G, Players, [Name-Efficiency|Acc]).

mostEffectivePlayers(G, Players, Acc):-
    get_max_value(Acc, V, 0),
    get_same_values(Acc, V, Players).


get_same_values([], _, []).
get_same_values([Name-V|List], Value, [Name|Players]):-
    V == Value,!,
    get_same_values(List, Value, Players).

get_same_values([_|List], Value, Players):-
    get_same_values(List, Value, Players).


get_max_value([], Res, Res).
get_max_value([_-Value|List], Res, V):-
    Value >= V,!,
    get_max_value( List, Res, Value).

get_max_value([_|List], Value, V):-
    get_max_value(List, Value, V).

% 10)

% com nick - verifica se o jogador pode jogar todos os jogos que joga
% sem nick - veriica se o 1o jogador pode jogar todos os jogos que jogo

% 12)

:- use_module(library(between)).
:- use_module(library(lists)).

% linha-coluna
matDist([[8],[8,2],[7,4,3],[7,4,3,1]]).
    
dist(E,E,0).
dist(L,C,Dist):-
    C > L,
    dist(C,L,Dist).
dist(L,C,Dist):-
    RealL is L - 1, matDist(X),
    nth1(RealL,X,Row),
    nth1(C,Row,Dist).

areClose(MaxDist,Pairs):-
    findall(L-C, (between(2,5,L),
                  between(1,4,C),
                  L \= C,
                  dist(L,C,D), 
                  D =< MaxDist), 
                 List), 
    removeSymmetrical(List,Pairs).

removeSymmetrical(List,Pairs):-
    removeSymmetrical(List,[],Pairs).

removeSymmetrical([],Pairs,Pairs).
removeSymmetrical([L-C|Rest],Acc,Pairs):-
    \+member(C-L,Acc),
    removeSymmetrical(Rest,[L-C|Acc],Pairs).
removeSymmetrical([_|Rest],Acc,Pairs):-
    removeSymmetrical(Rest,Acc,Pairs).



