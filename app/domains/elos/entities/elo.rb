# frozen_string_literal: true

module Elos
  module Entities
    class Elo < Dry::Struct
      attribute :player_id, Types::Strict::Integer
      attribute :match_id, Types::Strict::Integer
      attribute :level, Types::Strict::Integer

      def self.from_ar(datum:)
        new(
          player_id: datum.player_id,
          match_id: datum.match_id,
          level: datum.level
        )
      end
    end
  end
end
