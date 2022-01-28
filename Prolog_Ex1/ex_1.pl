/*Family Schema*/

/*a*/
female(grace).
male(frank).
female(dede).
male(jay).
female(gloria).
male(javier).
female(barb).
male(merle).
male(phil).
female(claire).
male(mitchell).
male(joe).
male(manny).
male(cameron).
female(pameron).
male(bo).
male(dylan).
female(haley).
male(alex).
male(luke).
female(lily).
male(rexford).
male(calhoun).
male(george).
female(poppy).

parent(grace, phil).
parent(frank, phil).
parent(dede, claire).
parent(jay, claire).
parent(dede, mitchell).
parent(jay, mitchell).
parent(jay, joe).
parent(gloria, joe).
parent(gloria, manny).
parent(javier, manny).
parent(barb, cameron).
parent(merle, cameron).
parent(barb, pameron).
parent(merle, pameron).
parent(phil, haley).
parent(claire, haley).
parent(phil, alex).
parent(claire, alex).
parent(phil, luke).
parent(claire, luke).
parent(mitchell, lily).
parent(cameron, lily).
parent(mitchell, rexford).
parent(cameron, rexford).
parent(pameron, calhoun).
parent(bo, calhoun).
parent(dylan, george).
parent(haley, george).
parent(dylan, poppy).
parent(haley, poppy).

/*b*/
/*
i) female(haley).
ii) male(gil).
iii) parent(frank, phil).
iv) parent(X, claire).
v) parent(gloria, X).
vi) parent(jay, _X), parent(_X, Y).
vii) parent(X, _Y), parent(_Y, lily).
viii) parent(alex, X).
ix) parent(jay, X), \+ parent(gloria, X).
*/

/*c (predicados)*/
father(X, Y) :- parent(X,Y), male(X).
grandparent(X,Y) :- parent(Z,Y), parent(X,Z).
grandmother(X,Y) :- parent(Z,Y), parent(X,Z), female(X).
siblings(X,Y) :- parent(Z,X), parent(U,X), Z\==U, parent(Z,Y), parent(U,Y), X\==Y.
halfSiblings(X,Y) :- X\==Y, (parent(Z,X), parent(U,X), parent(Z,Y), \+parent(U,Y)).
cousins(X,Y) :- parent(Z,X), parent(U,Y), siblings(Z,U).
uncle(X,Y) :- male(X), parent(Z,Y), siblings(Z,X).

/*d*/
/*
cousins(haley, lily).
father(X, luke).
uncle(X, lily).
grandparent(X,_).
siblings(X,Y).
*/

/*e*/
married(P1, P2, Year) :- P1 \== P2.