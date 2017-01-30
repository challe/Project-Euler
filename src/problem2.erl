-module(problem2).
-export([fibonacci/1]).

fibonacci(0) -> 0;
fibonacci(1) -> 1;
fibonacci(N) -> fibonacci(N, 2, [1, 0]).
fibonacci(N, C, List) when C < N ->
    case lists:nth(1, List) + lists:nth(2, List) < 4000000 of
        true -> fibonacci(N, C+1, [lists:nth(1, List) + lists:nth(2, List)|List]);
        false -> fibonacci(N, C+1, List)
    end;
fibonacci(_, _, List) -> sum(List).

sum(List) -> sum(List, 0).
sum([H|List], S) when erlang:length(List) > 0 ->
    if
        H rem 2 == 0 -> sum(List, S+H);
        H rem 2 /= 0 -> sum(List, S)
    end;
sum(_, S) -> io:format("Summan: ~p\n", [S]).