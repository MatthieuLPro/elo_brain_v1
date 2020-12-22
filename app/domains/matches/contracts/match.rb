# frozen_string_literal: true

module Matches
  module Contracts
    class Match < Dry::Validation::Contract
      params do
        required(:player1_name).value(:string)
        required(:player1_score).value(:integer)
        required(:player2_name).value(:string)
        required(:player2_score).value(:integer)
      end

      rule(:player1_score) do
        key.failure('must be zero or positive') unless value.zero? || value.positive?
      end

      rule(:player2_score) do
        key.failure('must be zero or positive') unless value.zero? || value.positive?
      end

      rule(:player1_score, :player2_score) do
        key.failure('must be different') if values[:player1_score] == values[:player2_score]
      end

      rule(:player1_name, :player2_name) do
        key.failure('must be different') if values[:player1_name] == values[:player2_name]
      end
    end
  end
end
