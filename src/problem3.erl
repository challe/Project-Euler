-module(problem3).
-export([prime/1]).

prime(N) when N > 1 ->
    trial_division(N,2,[]).
    
trial_division(N, D, Factors) when N rem D == 0 ->
    case D =< math:sqrt(N) andalso is_prime(D) of
        true -> trial_division(N, D+1, [D|Factors]);
        false -> lists:nth(1, Factors)
    end;
trial_division(N, D, Factors) ->
    trial_division(N, D+1, Factors).

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