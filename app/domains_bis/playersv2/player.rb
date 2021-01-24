# frozen_string_literal: true

module Playersv2
  class Player < Dry::Struct
    attribute :elo, Types::Strict::Integer
    attribute :nb_matches, Types::Strict::Integer

    def self.from(elo:, nb_matches:)
      new(
        elo: elo,
        nb_matches: nb_matches
      )
    end
  end
end
