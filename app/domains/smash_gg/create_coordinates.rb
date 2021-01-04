# frozen_string_literal: true

module SmashGg
  class CreateCoordinates
    def call(place:)
      ::SmashGg::Dictionaries::WithDictionary
        .new(dictionary: ::SmashGg::Dictionaries::Coordinates::LIST)
        .translate(value: place)
    end
  end
end
