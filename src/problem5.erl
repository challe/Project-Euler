-module(problem5).
-export([smallest_multiple/1]).

smallest_multiple(Max) ->
    smallest_multiple(1, Max).
smallest_multiple(X, Max) ->
    case is_divisable(X, Max) of
        true -> io:format("Hittade minsta ~p\n", [X]);
        false -> smallest_multiple(X+1, Max)
    end.

is_divisable(N, Max) ->
    is_divisable(N, 1, Max).
is_divisable(N, D, Max) when D =< Max ->
    case N rem D =:= 0 of
        true -> is_divisable(N, D+1, Max);
        false -> false
    end;
is_divisable(_,_,_) -> true.