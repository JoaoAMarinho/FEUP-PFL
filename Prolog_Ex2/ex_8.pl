% a) list_to(+N, ?List)

list_to(+N, ?List)


% b) list_from_to(+Inf, +Sup, ?List)
 
list_from_to(Inf, Sup):- list_from_to(Inf, Sup, []).

list_from_to(Inf, Sup, [Inf|List]):- Inf (@=<) Sup,
                                     Inf1 is Inf+1,
                                     list_from_to(Inf1, Sup, List).
