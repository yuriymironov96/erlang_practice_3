-module(lesson3_task02).
-export([words/1]).

words(Phrase) -> words(Phrase, <<>>, []).

% add Word to a list of Results if we the first character of a binary string is space
words(<<" ", Rest/binary>>, Word, Result) ->
    words(Rest, <<>>, [Word | Result]);
% append Char to current Word if Char is not a space
words(<<Char, Rest/binary>>, Word, Result) ->
    words(Rest, <<Word/binary, Char>>, Result);
% return Result list if input Phrase is emptied. It has to be reversed because we only appendword
% to the beginning of a list
words(<<>>, Word, Result) ->
    reverse([Word | Result]).

% from previous practice
reverse(Arr) -> reverse(Arr, []).
reverse([], To) -> To;
reverse([FromFirst | FromRest], To) -> reverse(FromRest, [FromFirst | To]).
