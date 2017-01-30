-module(problem1).
-export([sum/1]).

sum(Max) ->
    sum(0, Max, 0).
sum(C, Max, Sum) when C rem 3 == 0; C rem 5 == 0, C < Max ->
    sum(C+1, Max, Sum+C);
sum(C, Max, Sum) when C < Max ->
    sum(C+1, Max, Sum);
sum(C, Max, Sum) when C == Max ->
    Sum.