# frozen_string_literal: true

module SmashGg
  module Contracts
    class Area < Dry::Validation::Contract
      COORDINATES_CONSTRAINED = /(\A\d{1,3}\.\d{1,4},\d{1,3}\.\d{1,4}\z|online)/.freeze
      RADIUS_FORMAT = /\d{1,3}\mi{1}\z/.freeze

      params do
        required(:coordinates).value(:string)
        required(:radius).value(:string)
      end

      rule(:coordinates) do
        key.failure('must be in coordinate format or to be online') unless value.match(COORDINATES_CONSTRAINED)
      end

      rule(:radius) do
        key.failure('must be in radius format') unless value.match(RADIUS_FORMAT)
      end
    end
  end
end
