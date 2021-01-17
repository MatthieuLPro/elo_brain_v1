# frozen_string_literal: true

module Elos
  module Entities
    class Player < Dry::Struct
      attribute :information, Types.Instance(::Players::Entities::Information)
      attribute :development_coefficient, Types.Instance(DevelopmentCoefficient)
      attribute :probability_of_win, Types.Instance(ProbabilityOfWin)

      def self.from_contract(contract:)
        new(
          information: contract[:information],
          development_coefficient: contract[:development_coefficient],
          probability_of_win: contract[:probability_of_win]
        )
      end
    end
  end
end
