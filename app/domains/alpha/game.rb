# frozen_string_literal: true

module Alpha
  class Game < Dry::Struct
    VIDEO_GAME_IDS = {
      tekken7: '17',
      super_smash_bros_ultimate: '1386',
      dead_or_alive6: '3189',
      mortal_kombat11: '3200'
    }.freeze
    VIDEO_GAME_ID_CONSTRAINED = /\d{1,4}/.freeze

    attribute :video_game_id, Types::Strict::String.constrained(format: VIDEO_GAME_ID_CONSTRAINED)

    def self.with_name(name:)
      return Errors::UnknownVideoGame unless VIDEO_GAME_IDS[name.to_sym]

      new(
        video_game_id: VIDEO_GAME_IDS[name.to_sym]
      )
    end
  end
end
