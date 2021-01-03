# frozen_string_literal: true

module Matches
  module Entities
    class PlayerResult < Dry::Struct
      attribute :id, Types::Strict::Integer
      attribute :score, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          id: contract[:id],
          score: contract[:score]
        )
      end
    end
  end
end
