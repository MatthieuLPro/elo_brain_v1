# frozen_string_literal: true

module Players
  module Contracts
    class PlayerInformation < Dry::Validation::Contract
      params do
        required(:nb_matches).value(:integer)
        required(:current_elo).value(:integer)
      end

      rule(:nb_matches) do
        key.failure('must be zero or positive') unless value.zero? || value.positive?
      end

      rule(:current_elo) do
        key.failure('must be positive') unless value.positive?
      end
    end
  end
end
