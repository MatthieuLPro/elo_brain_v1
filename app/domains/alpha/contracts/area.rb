# frozen_string_literal: true

module Alpha
  module Contracts
    class Area < Dry::Validation::Contract
      PLACES_COLLECTION = %w[paris lyon marseille online].freeze
      RADIUS_FORMAT = /\d{1,3}\mi{1}\z/.freeze

      params do
        required(:place).value(:string)
        required(:radius).value(:string)
      end

      rule(:place) do
        key.failure('must be in the list') unless PLACES_COLLECTION.include? value
      end

      rule(:radius) do
        key.failure('must respect a specific format') unless value.match(RADIUS_FORMAT) || value.empty?
      end
    end
  end
end
