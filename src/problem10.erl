-module(problem10).
-export([sum_primes/1]).

sum_primes(N) ->
    Result = [X ||
        X <- lists:seq(2, N),
        is_prime(X)
    ],

    lists:foldl(fun(X, Sum) -> X + Sum end, 0, Result).

is_prime(N) ->
    if
        N == 2 -> true;
        N == 3 -> true;
        N rem 2 == 0 -> false;
        N rem 3 == 0 -> false;
        true -> prime_iterator(N, 5, 2)
    end.
prime_iterator(N, I, W) when I * I =< N ->
    if
        N rem I == 0 -> false;
        true -> prime_iterator(N, I+W, 6-W)
    end;
prime_iterator(_,_,_) -> true.