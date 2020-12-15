# frozen_string_literal: true

module Elos
  module DevelopmentCoefficient
    class PlayerCoefficient
      def call(nb_matches:, elo:)
        klass = DevelopmentCoefficient::RunConditions.new(
          Conditions::Default.new,
          Conditions::Starting.new(nb_matches: nb_matches),
          Conditions::Amateur.new(elo: elo),
          Conditions::Pro.new(elo: elo)
        ).condition.class
        coefficient(klass)
      end

      private

      def coefficient(klass)
        klass::COEFFICIENT
      end
    end
  end
end
