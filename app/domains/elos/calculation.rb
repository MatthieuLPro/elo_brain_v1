# frozen_string_literal: true

module Elos
  class Calculation
    def initialize(winner_elo:, looser_elo:)
      @winner_elo = winner_elo
      @looser_elo = looser_elo
    end

    def call
      winner_probability = Elos::ProbabilityOfWin.new.call(difference_of_elo: @winner_elo - @looser_elo)
      looser_probability = Elos::ProbabilityOfWin.new.call(difference_of_elo: @looser_elo - @winner_elo)
    end
  end
end
