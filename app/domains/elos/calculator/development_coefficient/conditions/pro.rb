# frozen_string_literal: true

module Elos
  module Calculator
    module DevelopmentCoefficient
      module Conditions
        class Pro
          COEFFICIENT = 10
          ELO_MIN = 2_399
          def initialize(elo:)
            @elo = elo
          end

          def eligible?
            @elo > ELO_MIN
          end
        end
      end
    end
  end
end
