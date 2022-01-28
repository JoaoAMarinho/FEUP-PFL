airport('Aeroporto Francisco Sá Carneiro','LPPR','Portugal').
airport('Aeroporto Humberto Delgado','LPPT','Portugal').
airport('Aeroporto Adolfo Suarez Madrid-Barajas','LEMD','Spain').
airport('Aeroporto de Paris-Charles-de-Gaule Roissy Airport','LFPG','France').
airport('Aeroporto Internazionale di Roma-Fiumicino - Leonardo da Vinci','LIRF','Italy').

company('TAP','TAP Air Portugal',1945,'Portugal').
company('RYR','Ryanair',1984,'Ireland').
company('AFR','Société Air France, S.A.',1933,'France').
company('BAW','British Airways',1974,'United Kingdom').

flight('TP1923','LPPR','LPPT',1115,55,'TAP').
flight('TP1968','LPPT','LPPR',2235,55,'TAP').
flight('TP842','LPPT','LIRF',1450,195,'TAP').
flight('TP843','LIRF','LPPT',1935,195,'TAP').
flight('FR5483','LPPR','LEMD',630,105,'RYR').
flight('FR5484','LEMD','LPPR',1935,105,'RYR').
flight('AF1024','LFPG','LPPT',940,155,'AFR').
flight('AF1025','LPPT','LFPG',1310,155,'AFR').

% 1)
short(Flight):-
    flight(Flight, _,_,_,Duration,_),
    Duration < 90.

% 2)
shorter(F1, F2, F1):-
    flight(F1, _,_,_,D1,_),
    flight(F2, _, _,_, D2,_),
    D1 < D2.

shorter(F1, F2, F2):-
    flight(F1, _,_,_,D1,_),
    flight(F2, _, _,_, D2,_),
    D2 < D1.

% 3)
arrivalTime(F1, Time):-
    flight(F1, _, _, Departure, D1, _),
    HourDep is Departure  // 100,
    DepMin is Departure mod 100,
    HourDur is D1 // 60,
    MinDur is D1 mod 60,
    Minutes is (MinDur + DepMin) mod 60,
    ToSum is (MinDur + DepMin) // 60,
    Hours is (HourDep + HourDur + ToSum) * 100,
    Time is Hours + Minutes.

% 4)
countries(C, LoC):-
    countries(C, LoC, []).
countries(C, LoC, Acc):-
    airport(_,_,Country),
    operates(C, Country),
    \+member(Country, Acc),!,
    countries(C, LoC, [Country|Acc]).
countries(_, Res, Res).

operates(Company, Country):-
    flight(_, P1,P2,_,_,Company),
    (airport(_,P1, Country) ; airport(_,P2, Country)), !.


% 5)
pairableFlights:-
    pairableFlights([]).

pairableFlights(List):-
    flight(F1, _, D, _,_, _),
    flight(F2, D, _, H, _, _),
    arrivalTime(F1, Time),
    Delta is H - Time,
    Delta >= 30, Delta =< 130,
    \+ member(D-F1-F2, List), !,
    write(D), write(' - '), write(F1), write(' \\ '), write(F2), nl,
    pairableFlights([D-F1-F2|List]).

pairableFlights(_).

% 6)

tripDays(X, Y, Z, Days):-
    tripDays(X, Y, Z, Days, 1).

tripDays([_], _, [], Days, Days).

tripDays([From, To |Trip], Time, [Res|FlightT], Days, TestDays):-
    get_all_flights(From, To, [V | FlightTimes], []),
    get_best_time(FlightTimes, Time, V, Flight-Res),
    arrivalTime(Flight, NewTime),
    (NewTime - Time < 0 -> Increment = 1; Increment =0),
    RealTime is NewTime + 30,
    NewDays is TestDays + Increment,
    tripDays([To|Trip], RealTime, FlightT, Days, NewDays).

get_all_flights(From, To, FlightTimes, Acc):-
    airport(_, A1, From),
    airport(_, A2, To),
    flight(F, A1, A2, H, _, _),
    \+ member(F-H, Acc),
    get_all_flights(From, To, FlightTimes, [F-H| Acc]).

get_all_flights(_, _, Res, Res).

get_best_time(_, _, Res, Res).
get_best_time([F-H|List], Time, _-Test, Res):-
    H >= Time,
    H < Test,
    get_best_time(List, Time, F-H, Res).
get_best_time([_|List], Time, Test, Res):-
    get_best_time(List, Time, Test, Res).

% 7)
avgFlightLengthFromAirport(A, AvgLength):-
    findall(Time, 
        (
            flight(_,A,_,_,Time,_)
        ),
        Times),
    length(Times, L),
    sumList(Times, Res),
    AvgLength is Res / L.

sumList([], 0).
sumList([H|Rest], V):-
    sumList(Rest, X),
    V is X + H.

% 8)
:- use_module(library(lists)).

mostInternational(L):-
    findall( Company-Countries,
        (   
            company(Company, _, _,_),
            get_countries(Company, Countries)
        ),
    L).

get_countries(Company, Countries):-
    findall(Country1, 
        (
            flight(A, P1,P2,B,C,Company),
            airport(_,P1, Country1),
            airport(_,P2, Country2)
        ),
    Countries).

% 9) e 10)
make_pairs(L, P, [X-Y|Zs]):-
  select(X, L, L2),
  select(Y, L2, L3),
  G =.. [P,X,Y], G,
  make_pairs(L3, P, Zs).
makepairs(, _, []).
makepairs([], , []).

dif_max_2(X,Y):- X < Y, X >= Y - 2.

%11

get_max_pair([], S, _, S).
get_max_pair([Cur|Next], S, Counter, Temp):-
  length(Cur, Length),
  Length > Counter,
  get_max_pair(Next, S, Length, Cur).
get_max_pair([Cur|Next], S, Counter, Temp):-
  get_max_pair(Next, S, Counter, Temp).
  
make_max_pairs(L, P, S):-
  setof(Res, make_pairs(L,P, Res), SS),
  get_max_pair(SS, S, 0, Temp).

%12

stateMachine(N, 2-3, [(NewX, NewY), (NewY, NewX)|List], (X,Y)):-
  NewX is X + 2,
  NewY is Y + 3,
  NewX =< N,
  NewY =< N,
  stateMachine(N, 1-2, List, (NewX, NewY)).
stateMachine(N, 1-2, [(NewX, NewY), (NewY, NewX)|List], (X,Y)):-
  NewX is X + 1,
  NewY is Y + 2,
  NewX =< N,
  NewY =< N,
  stateMachine(N, 2-3, List, (NewX, NewY)).

stateMachine(_, _, [], _).


whitoff(N, [(1,1)|W]):-
  stateMachine(N, 1-2, W, (1,1)).