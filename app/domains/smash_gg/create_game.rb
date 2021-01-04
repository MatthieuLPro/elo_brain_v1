# frozen_string_literal: true

module SmashGg
  class CreateGame
    def call(game:)
      ::SmashGg::Dictionaries::WithDictionary
        .new(dictionary: ::SmashGg::Dictionaries::Games::LIST)
        .translate(value: game)
    end
  end
end
