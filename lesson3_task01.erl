-module(lesson3_task01).
-export([first_word/1]).

first_word(Phrase) -> first_word_bin(Phrase, <<>>).

first_word_bin(<<>>, Word) ->
    Word;
first_word_bin(<<" ", _/binary>>, Word) ->
    Word;
first_word_bin(<<First, Rest/binary>>, Word) ->
    first_word_bin(Rest, <<Word/binary, First>>).
