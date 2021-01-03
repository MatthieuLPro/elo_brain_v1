# frozen_string_literal: true

module Elos
  module Calculator
    module EloAfterMatch
      class Winner
        MAX_PROBABILITY = 1.0
        def initialize(current_elo:)
          @current_elo = current_elo
        end

        def call(development_coefficient:, probability_of_win:)
          @current_elo + development_coefficient * (MAX_PROBABILITY - probability_of_win)
        end
      end
    end
  end
end
