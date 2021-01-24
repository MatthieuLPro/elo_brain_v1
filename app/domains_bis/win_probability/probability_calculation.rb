# frozen_string_literal: true

module WinProbability
  class ProbabilityCalculation
    def call(difference_of_elo:)
      1.0 / (1.0 + 10.0**(-1.0 * difference_of_elo / 400.0))
    end
  end
end
