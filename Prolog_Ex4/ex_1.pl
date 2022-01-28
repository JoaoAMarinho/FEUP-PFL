:-dynamic male/1, female/1, parent/2.

father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
child(X,Y) :- parent(Y,X).
grandparent(X,Y) :- parent(X,_Z), parent(_Z,Y). 
% X é meu avô se X for pai do meu pai ou da minha mãe
grandfather(X,Y) :- father(X,_Z), parent(_Z,Y). 
% X é minha avó se X for mãe do meu pai ou da minha mãe
grandmother(X,Y) :- mother(X,_Z), parent(_Z,Y). 
% X e Y são irmãos se tiverem os mesmos progenitores
sibling(X,Y) :- parent(A,X), parent(B,Y), parent(A,X), parent(B,Y), A\==B. 
% X e Y são meios irmãos se tiverem um e um só progenitor em comum
halfsibling(X,Y) :- parent(A,X), parent(B,X), parent(B,Y), parent(C,Y), A\==B, A\==C, B\==C.
% X é meu tio se for irmão de um dos meus progenitores
uncle(X,Y) :- sibling(X,_Z), parent(_Z,Y).
% X é meu primo se for filho de um tio meu
cousin(X,Y) :- child(Y,_Z), uncle(_Z,X).

female(grace).
female(dede).
female(claire).
female(haley).
female(alex).
female(poppy).

male(mitchell).
male(frank).
male(jay).
male(phil).
male(dylan).
male(luke).
male(george).

parent(grace, phil).
parent(frank,phil).
parent(dede,claire).
parent(jay,claire).
parent(phil,haley).
parent(phil,alex).
parent(phil,luke).
parent(claire,haley).
parent(claire,alex).
parent(claire,luke).
parent(dylan,george).
parent(dylan,poppy).
parent(haley,george).
parent(haley,poppy).

% a
add_person:-
    write('Give me a person ([male/female]-name):\n'),
    read(Type-Name),
    add_person(Type, Name).
add_person(male, Name):-
    assert(male(Name)).
add_person(female, Name):-
    assert(female(Name)).

% b
add_parents(Person):-
    male(Person),
    write('fatherName-motherName\n'),
    read(Name1-Name2),
    add_person(male, Name1),
    add_person(female, Name2),
    assert(parent(Name1, Person)),
    assert(parent(Name2, Person)).

add_parents(Person):-
    female(Person),
    write('fatherName-motherName\n'),
    read(Name1-Name2),
    add_person(male, Name1),
    add_person(female, Name2),
    assert(parent(Name1, Person)),
    assert(parent(Name2, Person)).

% c
remove_person:-
    write('sex-name:\n'),
    read(Sex-Name),
    remove_sexy_person(Sex, Name).
remove_sexy_person(male, Name):-
    retract(male(Name)),
    retractall(parent(Name,_)),
    retractall(parent(_,Name)).
remove_sexy_person(female, Name):-
    retract(female(Name)),
    retractall(parent(Name,_)),
    retractall(parent(_,Name)).