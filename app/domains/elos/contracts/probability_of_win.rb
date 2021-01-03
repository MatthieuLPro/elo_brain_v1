# frozen_string_literal: true

module Elos
  module Contracts
    class ProbabilityOfWin < Dry::Validation::Contract
      params do
        required(:probability).value(:float)
      end

      rule(:probability) do
        key.failure('must be zero or positive') unless value.zero? || value.positive?
      end
    end
  end
end
