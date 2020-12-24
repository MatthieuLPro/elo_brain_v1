# frozen_string_literal: true

module Alpha
  module Entities
    class Game < Dry::Struct
      attribute :video_game_id, Types::Strict::String

      def self.from_contract(contract:)
        new(
          video_game_id: contract[:game_id]
        )
      end
    end
  end
end
