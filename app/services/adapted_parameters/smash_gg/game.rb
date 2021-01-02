# frozen_string_literal: true

module AdaptedParameters
  module SmashGg
    class Game
      def id(game:)
        ::SmashGg::Dictionaries::WithDictionary
          .new(dictionary: ::SmashGg::Dictionaries::Games::LIST)
          .translate(value: game)
      end
    end
  end
end
