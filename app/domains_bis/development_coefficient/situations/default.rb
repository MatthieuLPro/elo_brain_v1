# frozen_string_literal: true

# The default condition is always true
# It is call at the end of the run_conditions.rb's condition method
# This class manages all player's cases which is not working
# Then run_condition.rb's condition method always return an condition object
module DevelopmentCoefficient
  module Situations
    class Default
      COEFFICIENT = 0
      def eligible?
        true
      end
    end
  end
end
