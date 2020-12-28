# frozen_string_literal: true

module Matches
  class RunConditions
    def initialize(*conditions)
      @conditions = conditions
    end

    def is_played?
      @conditions.all?(&:is_played?)
    end
  end
end
