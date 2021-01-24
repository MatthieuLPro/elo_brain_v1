# frozen_string_literal: true

module Elosv2
  module Services
    class LaunchNewEloCalculation
      def call(strategy:, nb_matches:, player_elo:, opponent_elo:)
        coefficient = development_coefficient(nb_matches, player_elo)
        probability = win_probability(player_elo - opponent_elo)
        calculation_strategy(strategy).new_elo(elo: player_elo, development_coefficient: coefficient, win_probability: probability)
      end

      private

      def calculation_strategy(strategy)
        EloCalculations::Strategies.new.call(strategy: strategy)
      end

      def development_coefficient(nb_matches, elo)
        DevelopmentCoefficient::SituationCoefficient.new.call(nb_matches: nb_matches, elo: elo)
      end

      def win_probability(difference_of_elo)
        WinProbability::ProbabilityCalculation.new.call(difference_of_elo: difference_of_elo)
      end
    end
  end
end
