-module(problem6).
-export([sum_square_difference/1]).

sum_square_difference(N) ->
    sum_square_difference(1, N, 0, 0).
sum_square_difference(C, N, Powers, Sum) when C =< N ->
    sum_square_difference(C+1, N, Powers+math:pow(C, 2), Sum+C);
sum_square_difference(_,_,Powers,Sum) ->
    math:pow(Sum, 2) - Powers.