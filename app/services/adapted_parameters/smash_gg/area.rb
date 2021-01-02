# frozen_string_literal: true

module AdaptedParameters
  module SmashGg
    class Area
      def coordinates(place:)
        ::SmashGg::Dictionaries::WithDictionary
          .new(dictionary: ::SmashGg::Dictionaries::Coordinates::LIST)
          .translate(value: place)
      end

      def radius(radius:)
        ::SmashGg::Entities::Decorators::WithDefault
          .new(default: ::SmashGg::Entities::Decorators::DefaultRadius.new)
          .decorate(value: radius)
      end
    end
  end
end
