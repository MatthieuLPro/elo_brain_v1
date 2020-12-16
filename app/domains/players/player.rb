# frozen_string_literal: true

module Players
  class Player < Dry::Struct
    attribute :nb_matches, Types::Strict::Integer
    attribute :current_elo, Types::Strict::Integer

    def self.with_verification_on(elos_collection)
      nb_matches = elos_collection.count
      current_elo = current_elo(elos_collection)
      new(
        nb_matches: nb_matches,
        current_elo: current_elo
      )
    end

    def self.current_elo(elos_collection)
      return ::Elo::STARTING_ELO if elos_collection.count.zero?

      elos_collection.last_level
    end
  end
end
