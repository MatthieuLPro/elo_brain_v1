# frozen_string_literal: true

module SmashGg
  class CreateCoordinates
    SMASHGG_DICTIONARY = ::SmashGg::Dictionaries::Coordinates::LIST

    def initialize(dictionary: SMASHGG_DICTIONARY)
      @dictionary = dictionary
    end

    def call(place:)
      ::SmashGg::Dictionaries::WithDictionary
        .new(dictionary: @dictionary)
        .translate(value: place)
    end
  end
end
