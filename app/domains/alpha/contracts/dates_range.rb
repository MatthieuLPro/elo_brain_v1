# frozen_string_literal: true

module Alpha
  module Contracts
    class DatesRange < Dry::Validation::Contract
      params do
        required(:before_date).value(:integer)
        required(:after_date).value(:integer)
      end

      rule(:before_date) do
        key.failure('must not be in the future') if value > Time.now.to_i
      end

      rule(:after_date) do
        key.failure('must not be in the future') if value > Time.now.to_i
      end

      rule(:before_date, :after_date) do
        key.failure('after_date must be before before_date') if values[:after_date] >= values[:before_date]
      end
    end
  end
end
