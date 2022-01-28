% c)  fibonacci(+N, ?F)
fibonacci(0,0).
fibonacci(1,1).

fibonacci(N, Value) :- N > 0,
                       N1 is N - 1,
                       N2 is N - 2,
                       fibonacci(N1, Val1),
                       fibonacci(N2, Val2),
                       Value is Val1 + Val2.
fibonacciTail(0, 0).
fibonacciTail(1,1).
fibonacciTail(N, Value) :- fibonacciTail(N,0,1,Value).
fibonacciTail(0,N,_,N).
fibonacciTail(N,Prev1,Prev2,Value) :- N > 0,
                                      NPrev2 is Prev1 + Prev2,
                                      N1 is N-1,
                                      fibonacciTail(N1,Prev2,NPrev2,Value).

% d) isPrime(+X)

isPrime(X) :- X > 1,
              N is X-1,
              isPrime(X,N).
isPrime(X,1).
isPrime(X,N) :- M is X mod N,
                M \== 0,
                N1 is N-1,
                isPrime(X,N1). 