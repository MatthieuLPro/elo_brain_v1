# frozen_string_literal: true

module Elos
  module Entities
    class DevelopmentCoefficient < Dry::Struct
      attribute :coefficient, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          coefficient: contract[:coefficient]
        )
      end
    end
  end
end
