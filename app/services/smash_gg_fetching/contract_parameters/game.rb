# frozen_string_literal: true

module SmashGgFetching
  module ContractParameters
    class Game
      def id(game:)
        Alpha::Dictionaries::WithDictionary
          .new(dictionary: Alpha::Dictionaries::Games::LIST)
          .translate(value: game)
      end
    end
  end
end
