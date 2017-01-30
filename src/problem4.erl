-module(problem4).
-export([is_palindrome/1,palindrome/0]).

palindrome() -> 
    List = [I*J || I <- lists:seq(100,999), J <- lists:seq(100,999)],
    palindrome(lists:reverse(lists:usort(List))).

palindrome([H|List]) when erlang:length(List) > 0 ->
    case is_palindrome(H) of
        true -> io:format("Largest palindrome: ~p\n", [H]);
        false -> palindrome(List)
    end.

is_palindrome(N) when is_integer(N) ->
    is_palindrome(integer_to_list(N));
is_palindrome(List) ->
    is_palindrome(List, 1, erlang:length(List)).
is_palindrome(List, S, E) when S =< E ->
    case lists:nth(S, List) == lists:nth(E, List) of
        true -> is_palindrome(List, S+1, E-1);
        false -> false
    end;
is_palindrome(_, _, _) -> true.