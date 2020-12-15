# frozen_string_literal: true

module Elos
  module EloAfterMatch
    class Winner
      def initialize(current_elo:)
        @current_elo = current_elo
      end

      def call(development_coefficient:, probability_of_win:)
        @current_elo + development_coefficient * (1.0 - probability_of_win)
      end
    end
  end
end
