# frozen_string_literal: true

module DevelopmentCoefficient
  class SituationCoefficient
    def call(nb_matches:, elo:)
      klass = EligibleSituation.new(
        Situations::Default.new,
        Situations::Starting.new(nb_matches: nb_matches),
        Situations::Amateur.new(elo: elo),
        Situations::Pro.new(elo: elo)
      ).situation.class
      coefficient(klass)
    end

    private

    def coefficient(klass)
      klass::COEFFICIENT
    end
  end
end
