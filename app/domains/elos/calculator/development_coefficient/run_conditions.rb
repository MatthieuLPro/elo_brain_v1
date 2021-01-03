# frozen_string_literal: true

module Elos
  module Calculator
    module DevelopmentCoefficient
      class RunConditions
        def initialize(default_condition, *conditions)
          @default_condition = default_condition
          @conditions = conditions
        end

        def condition
          @conditions.each do |condition|
            return condition if condition.eligible?
          end
          @default_condition
        end
      end
    end
  end
end
