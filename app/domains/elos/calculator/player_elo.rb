# frozen_string_literal: true

module Elos
  module Calculator
    class PlayerElo
      def initialize(elo_after_match:)
        @elo_after_match = elo_after_match
      end

      def call(player:)
        @elo_after_match.new(current_elo: player.information.current_elo)
                        .call(
                          development_coefficient: player.development_coefficient.coefficient,
                          probability_of_win: player.probability_of_win.probability
                        )
      end
    end
  end
end
