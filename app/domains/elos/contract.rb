# frozen_string_literal: true

module Elos
  class Contract < Dry::Validation::Contract
    params do
      required(:winner_elo).value(:integer)
      required(:looser_elo).value(:integer)
    end

    rule(:winner_elo) do
      key.failure('must be zero or positive') unless value.zero? || value.positive?
    end

    rule(:looser_elo) do
      key.failure('must be zero or positive') unless value.zero? || value.positive?
    end
  end
end
