# frozen_string_literal: true

module SmashGg
  class CreateGame
    SMASHGG_DICTIONARY = ::SmashGg::Dictionaries::Games::LIST
    def initialize(dictionary: SMASHGG_DICTIONARY)
      @dictionary = dictionary
    end

    def call(game:)
      ::SmashGg::Dictionaries::WithDictionary
        .new(dictionary: @dictionary)
        .translate(value: game)
    end
  end
end
