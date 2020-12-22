# frozen_string_literal: true

module Matches
  module Entities
    class Player < Dry::Struct
      attribute :id, Types::Strict::Integer
      attribute :name, Types::Strict::String
      attribute :score, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          id: contract[:id],
          name: contract[:name],
          score: contract[:score]
        )
      end
    end
  end
end
