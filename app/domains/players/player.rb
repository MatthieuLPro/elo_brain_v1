# frozen_string_literal: true

module Players
  class Player < Dry::Struct
    attribute :id, Types::Strict::Integer
    attribute :name, Types::Strict::String
    attribute :nb_matches, Types::Strict::Integer
    attribute :current_elo, Types::Strict::Integer

    def self.from_contract(contract:)
      new(
        id: contract[:id],
        name: contract[:name],
        nb_matches: contract[:nb_matches],
        current_elo: contract[:current_elo]
      )
    end
  end
end
