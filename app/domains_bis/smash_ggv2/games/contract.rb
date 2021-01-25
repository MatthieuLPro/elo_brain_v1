# frozen_string_literal: true

module SmashGgv2
  module Games
    class Contract < Dry::Validation::Contract
      IDS_FORMAT = /\d{1,4}/.freeze
      MIN_LENGTH = 1
      MAX_LENGTH = 4

      params do
        required(:game_id).value(:string)
      end

      rule(:game_id) do
        unless value.length.between?(MIN_LENGTH, MAX_LENGTH)
          key.failure('must be in a length between 1 and 4 (include)')
        end
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
