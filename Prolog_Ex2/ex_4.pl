/*
 | ?- [a | [b, c, d] ] = [a, b, c, d] - Yes
 | ?- [a | b, c, d ] = [a, b, c, d] - No
 | ?- [a | [b | [c, d] ] ] = [a, b, c, d] - Yes
 | ?- [H | T] = [pfl, lbaw, redes, ltw] : H = pfl, T = [lbaw, redes, ltw]
 | ?- [H|T] = [lbaw, ltw] : H ? pfl, T = [ltw]
 | ?- [H|T] = [leic] : H ? leic, T = []
 | ?- [H|T] = [] - No (Obriga a um elemento)
 | ?- [H|T] = [leic, [pfl, ltw, lbaw, redes] ] : H = leic, T = [[pfl,ltw,lbaw,redes]]
 | ?- [H|T] = [leic, Two] : H = leic, T = [Two] 
 | ?- [Inst, feup] = [gram, LEIC] : Inst = gram, Leic = feup
 | ?- [One, Two | Tail] = [1, 2, 3, 4] : One = 1, Two = 2, Tail = [3,4] 
 | ?- [One, Two | Tail] = [leic | Rest] : One = leic, Rest = [T|Tail]
*/
%  7, 8.b, 8.c, 9 ,11