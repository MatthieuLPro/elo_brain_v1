# frozen_string_literal: true

module Matches
  module Contracts
    class Player < Dry::Validation::Contract
      params do
        required(:id).value(:integer)
        required(:name).value(:string)
        required(:score).value(:integer)
      end

      rule(:id) do
        key.failure('must be positive') unless value.positive?
      end

      rule(:score) do
        key.failure('must be zero or positive') unless value.zero? || value.positive?
      end
    end
  end
end
