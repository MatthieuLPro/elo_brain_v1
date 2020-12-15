# frozen_string_literal: true

module Elos
  module Calculator
    class Factory
      CALCULATOR_IDENTIFIER = {
        winner: Winner,
        looser: Looser
      }.freeze
      def initialize(
        player_coefficient_klass: ::Elos::DevelopmentCoefficient::PlayerCoefficient.new,
        probability_of_win_klass: ::Elos::ProbabilityOfWin.new
      )
        @player_coefficient_klass = player_coefficient_klass
        @probability_of_win_klass = probability_of_win_klass
      end

      def from_identifier(identifier:)
        klass = CALCULATOR_IDENTIFIER[identifier.to_sym]

        raise UnknownCalculatorError, identifier if klass.blank?

        klass.new(
          player_coefficient_klass: @player_coefficient_klass,
          probability_of_win_klass: @probability_of_win_klass
        )
      end
    end
  end
end
