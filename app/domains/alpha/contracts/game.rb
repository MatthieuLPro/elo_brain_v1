# frozen_string_literal: true

module Alpha
  module Contracts
    class Game < Dry::Validation::Contract
      IDS_FORMAT = /\d{1,4}/.freeze

      params do
        required(:game_id).value(:string)
      end

      rule(:game_id) do
        key.failure('must be in ids format') unless value.match(IDS_FORMAT)
      end

      rule(:game_id) do
        key.failure('must be positive') unless value.to_i.positive?
      end
    end
  end
end
