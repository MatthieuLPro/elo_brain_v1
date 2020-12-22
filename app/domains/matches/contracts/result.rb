# frozen_string_literal: true

module Matches
  module Contracts
    class Result < Dry::Validation::Contract
      params do
        required(:winner_id).value(:integer)
        required(:looser_id).value(:integer)
      end

      rule(:winner_id) do
        key.failure('must be positive') unless value.positive?
      end

      rule(:looser_id) do
        key.failure('must be positive') unless value.positive?
      end

      rule(:winner_id, :looser_id) do
        key.failure('must be different') if values[:winner_id] == values[:looser_id]
      end
    end
  end
end
