# frozen_string_literal: true

module Elos
  class NewElos < Dry::Struct
    attribute :winner, Types::Strict::Integer
    attribute :looser, Types::Strict::Integer

    def self.from_contract(contract:)
      new(
        winner: contract[:winner_elo],
        looser: contract[:looser_elo]
      )
    end
  end
end
