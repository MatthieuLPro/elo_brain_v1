# frozen_string_literal: true

module DevelopmentCoefficient
  module Situations
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
