# frozen_string_literal: true

module SmashGgFetching
  module ContractParameters
    class Area
      def coordinates(place:)
        Alpha::Dictionaries::WithDictionary
          .new(dictionary: Alpha::Dictionaries::Coordinates::LIST)
          .translate(value: place)
      end

      def radius(radius:)
        Alpha::Entities::Decorators::WithDefault
          .new(default: Alpha::Entities::Decorators::DefaultRadius.new)
          .decorate(value: radius)
      end
    end
  end
end
