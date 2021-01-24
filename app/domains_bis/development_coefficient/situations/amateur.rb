# frozen_string_literal: true

module DevelopmentCoefficient
  module Situations
    class Amateur
      COEFFICIENT = 20
      ELO_MAX = 2_400
      def initialize(elo:)
        @elo = elo
      end

      def eligible?
        @elo < ELO_MAX
      end
    end
  end
end
