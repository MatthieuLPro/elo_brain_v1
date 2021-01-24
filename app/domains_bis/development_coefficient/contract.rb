# frozen_string_literal: true

module DevelopmentCoefficient
  class Contract < Dry::Validation::Contract
    params do
      required(:coefficient).value(:integer)
    end

    rule(:coefficient) do
      key.failure('must be zero or positive') unless value.zero? || value.positive?
    end
  end
end
