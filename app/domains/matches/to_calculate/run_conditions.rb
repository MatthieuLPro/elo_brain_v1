# frozen_string_literal: true

module Matches
  module ToCalculate
    class RunConditions
      def initialize(*conditions)
        @conditions = conditions
      end

      def played?
        @conditions.all?(&:played?)
      end
    end
  end
end
