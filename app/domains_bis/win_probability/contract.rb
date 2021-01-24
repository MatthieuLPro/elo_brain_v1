# frozen_string_literal: true

module WinProbability
  class Contract < Dry::Validation::Contract
    params do
      required(:probability).value(:float)
    end

    rule(:probability) do
      key.failure('must be zero or positive') unless value.zero? || value.positive?
    end
  end
end
