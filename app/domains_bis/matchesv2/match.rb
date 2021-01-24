# frozen_string_literal: true

module Matchesv2
  class Match < Dry::Struct
    attribute :player1_situation, Types::Strict::String
    attribute :player2_situation, Types::Strict::String

    def self.from(player1_situation:, player2_situation:)
      new(
        player1_situation: player1_situation,
        player2_situation: player2_situation
      )
    end
  end
end
