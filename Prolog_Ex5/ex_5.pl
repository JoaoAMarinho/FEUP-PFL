% a) flight tp1949 from porto to lisbon at 16:15
:- op(600, xfx, from).
:- op(550, fx, flight).
:- op(550, xfy, to).
:- op(500, xfx, at).

/*
     from
   /\      \
flight       to
   |      /\    \
tp1949   porto   at
                /\   \
             lisbon  16:15
*/

% b) if X then Y else Z

:- op(600, yfx, else).
:- op(550, yfx, then).
:- op(550, fx, if).

/*
      else
    /\    \
   then    Z
  /\   \   
 if     Y
   \
    X
*/

else(X, _):- X.
else(_, Y):- Y.
then(X, Y):- X, Y.
if(X):- X.