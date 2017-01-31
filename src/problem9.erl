-module(problem9).
-export([pyth/1]).

pyth(N) ->
    [ {A*B*C} ||
        A <- lists:seq(1,N-2),
        B <- lists:seq(A+1,N-1),
        C <- lists:seq(B+1,N),
        A+B+C == N,
        A*A+B*B == C*C].