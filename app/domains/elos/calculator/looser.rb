# frozen_string_literal: true

module Elos
  module Calculator
    class Looser
      def initialize(player_coefficient_klass:, probability_of_win_klass:)
        @player_coefficient_klass = player_coefficient_klass
        @probability_of_win_klass = probability_of_win_klass
      end

      def call(winner:, looser:)
        development_coefficient = player_development_coefficient(looser.nb_matches, looser.current_elo)
        probability_of_win = player_probability_of_win(looser.current_elo, winner.current_elo)
        ::Elos::EloAfterMatch::Looser.new(current_elo: looser.current_elo).call(
          development_coefficient: development_coefficient,
          probability_of_win: probability_of_win
        )
      end

      private

      def player_development_coefficient(nb_matches, elo)
        @player_coefficient_klass.call(nb_matches: nb_matches, elo: elo)
      end

      def player_probability_of_win(player_elo, opponent_elo)
        @probability_of_win_klass.call(difference_of_elo: player_elo - opponent_elo)
      end
    end
  end
end
