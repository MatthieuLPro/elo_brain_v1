# frozen_string_literal: true

module Alpha
  module Contracts
    class Game < Dry::Validation::Contract
      NAMES_COLLECTION = %w[
        tekken7
        super_smash_bros_ultimate
        dead_or_alive6
        mortal_kombat11
      ].freeze

      params do
        required(:name).filled(:string)
      end

      rule(:name) do
        key.failure('must be in the list') unless NAMES_COLLECTION.include? value
      end
    end
  end
end
