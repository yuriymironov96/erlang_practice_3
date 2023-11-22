-module(lesson3_task03).
-export([split/2]).

% basically this is like task 2, but here we use case to detect a separator

split(Phrase, Separator) -> split(Phrase, Separator, <<>>, []).

split(<<>>, _, Word, Result) ->
    reverse([Word | Result]);
split(Phrase, Separator, Word, Result) ->
    case Phrase of
        % this way we can "slice" a separator from the beginning of a binary string, even if it
        % consists of multiple symbols
        <<Separator:(byte_size(Separator))/binary, Rest/binary>> ->
            split(Rest, Separator, <<>>, [Word | Result]);
        <<Char, Rest/binary>> ->
            split(Rest, Separator, <<Word/binary, Char>>, Result)
    end.

% from previous practice
reverse(Arr) -> reverse(Arr, []).
reverse([], To) -> To;
reverse([FromFirst | FromRest], To) -> reverse(FromRest, [FromFirst | To]).
