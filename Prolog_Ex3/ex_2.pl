data(one).
data(two).
data(three).
cut_test_a(X):- data(X).
cut_test_a(five).
cut_test_b(X):- data(X), !.
cut_test_b(five).
cut_test_c(X, Y):- data(X), !, data(Y).
cut_test_c(five).

% a) X = one ? X = two ? X = three ? X = five ? 
% b) X = one ?
% c) X = one, Y = one ? X = one, Y = two ? X = one, Y = three ?
