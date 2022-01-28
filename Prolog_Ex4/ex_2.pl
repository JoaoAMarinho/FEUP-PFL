% flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).


% a c d h
% a
get_all_nodes(ListOfAirports):-
    setof(Flight,(D, C,Co,H,Du)^(flight(Flight,D,C,Co,H,Du);flight(D,Flight,C,Co,H,Du)), ListOfAirports).

% c
find_flights(Origin, Destination, Flights):-
    depth_search(Origin, Destination, [], [], Flights).

depth_search(Origin, Origin, Flights, Codes, Codes).

depth_search(Origin, Destination, Flights, Codes, [Code | Codes]):-
    flight(Origin, Destination, _, Code, _, _).

depth_search(Origin, Destination, Flights, Codes, Res):-
    flight(Origin, Dest, _, Code, _, _),
    \+(member(Dest, Flights)),
    depth_search(Dest,Destination, [Dest|Flights],[Code|Codes], Res).

% d
find_flights_breadth(Origin, Destination, Flights):-
    breadth_search([[Origin]], Destination, [], [], Flights).

breadth_search([Origin|[]], _, Origin, Codes, Codes).

breadth_search(Origin, Destination, Flights, Codes, [Code | Codes]):-
    flight(Origin, Destination, _, Code, _, _).

breadth_search([Origin| Rest], Destination, Flights, Codes, Res):-
    find_all(Dest, (
        flight(Origin, Dest, _, Code, _, _),
        \+(member(Dest, Flights)),
        \+(member(Dest, Flights))
    ), L),
    append(Rest, L, NR);
    breadth_search(NR, Destination, [Dest|Flights],[Code|Codes], Res).