# frozen_string_literal: true

module Elos
  module DevelopmentCoefficient
    class RunConditions
      def initialize(*conditions)
        @conditions = conditions
      end

      def condition
        @conditions.each do |condition|
          return condition if condition.eligible?
        end
      end
    end
  end
end
