# frozen_string_literal: true

module EloCalculations
  class Variation
    MAX_PROBABILITY = 1.0
    def new_elo(_elo:, _development_coefficient:, _win_probability:)
      'Must call a strategy'
    end
  end
end
