# frozen_string_literal: true

module SmashGg
  module Contracts
    class Id < Dry::Validation::Contract
      params do
        required(:number).filled(:integer)
      end

      rule(:number) do
        key.failure('must be positive') unless value.positive?
      end
    end
  end
end
