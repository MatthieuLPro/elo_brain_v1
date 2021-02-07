# frozen_string_literal: true

module SmashGg
  module Areas
    module Dictionary
      DICTIONARY =
        {
          paris: '48.8534,2.3488',
          lyon: '45.75,4.85',
          marseille: '43.3,5.4',
          online: 'online'
        }.freeze

      def translate_to_coordinate(place:)
        DICTIONARY[place.to_sym]
      end
    end
  end
end
