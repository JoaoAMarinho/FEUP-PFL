immature(X):- adult(X), !, fail.
immature(X).
adult(X):- person(X), !, age(X, N), N >=18.
adult(X):- turtle(X), !, age(X, N), N >=50.
adult(X):- spider(X), !, age(X, N), N>=1.
adult(X):- bat(X), !, age(X, N), N >=5.

% cut1: red
% cut2: green 
% cut3: green
% cut4: green
% cut5: green