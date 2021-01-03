# frozen_string_literal: true

module Elos
  module Entities
    class ProbabilityOfWin < Dry::Struct
      attribute :probability, Types::Strict::Float

      def self.from_contract(contract:)
        new(
          probability: contract[:probability]
        )
      end
    end
  end
end
