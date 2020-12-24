# frozen_string_literal: true

module Alpha
  module Contracts
    class DatesRange < Dry::Validation::Contract
      TIME_NOW = Time.now.to_i
      TIMESTAMP_FORMAT = /\d{10}/.freeze

      params do
        required(:before_date).value(:string)
        required(:after_date).value(:string)
      end

      rule(:before_date) do
        key.failure('must be in timestamp format') unless value.match(TIMESTAMP_FORMAT)
      end

      rule(:after_date) do
        key.failure('must be in timestamp format') unless value.match(TIMESTAMP_FORMAT)
      end

      rule(:before_date) do
        key.failure('must not be in the future') if value.to_i > TIME_NOW
      end

      rule(:after_date) do
        key.failure('must not be in the future') if value.to_i > TIME_NOW
      end

      rule(:before_date, :after_date) do
        key.failure('after_date must be before before_date') if values[:after_date].to_i >= values[:before_date].to_i
      end
    end
  end
end
