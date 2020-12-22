# frozen_string_literal: true

module Matches
  module Entities
    class Match < Dry::Struct
      attribute :player1_name, Types::Strict::String
      attribute :player1_score, Types::Strict::Integer
      attribute :player2_name, Types::Strict::String
      attribute :player2_score, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          player1_name: contract[:player1_name],
          player1_score: contract[:player1_score],
          player2_name: contract[:player2_name],
          player2_score: contract[:player2_score]
        )
      end
    end
  end
end
