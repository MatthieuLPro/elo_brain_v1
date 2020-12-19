# frozen_string_literal: true

module Alpha
  class Game < Dry::Struct
    IDS_COLLECTION = {
      tekken7: '17',
      super_smash_bros_ultimate: '1386',
      dead_or_alive6: '3189',
      mortal_kombat11: '3200'
    }.freeze
    ID_CONSTRAINED = /\d{1,4}/.freeze

    attribute :video_game_id, Types::Strict::String.constrained(format: ID_CONSTRAINED)

    def self.with_name(name:)
      new(
        video_game_id: IDS_COLLECTION[name.to_sym]
      )
    end
  end
end
