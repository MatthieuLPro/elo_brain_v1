# frozen_string_literal: true

module SmashGg
  module Games
    module Dictionary
      DICTIONARY =
        {
          tekken7: '17',
          super_smash_bros_ultimate: '1386',
          dead_or_alive6: '3189',
          mortal_kombat11: '3200'
        }.freeze

      def translate_to_id(game_name:)
        DICTIONARY[game_name.to_sym]
      end
    end
  end
end
