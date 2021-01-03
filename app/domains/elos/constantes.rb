# frozen_string_literal: true

module Elos
  class Constantes
    DEFAULT_COEFFICIENT = Calculator::DevelopmentCoefficient::PlayerCoefficient.new
    DEFAULT_WIN_PROBABILITY = Calculator::ProbabilityOfWin::PlayerProbability.new
    COEFFICIENT_CONTRACT = Contracts::DevelopmentCoefficient.new
    COEFFICIENT_ENTITY = Entities::DevelopmentCoefficient
    PROBABILITY_CONTRACT = Contracts::ProbabilityOfWin.new
    PROBABILITY_ENTITY = Entities::ProbabilityOfWin

    def initialize(nb_matches:, player_elo:, opponent_elo:)
      @nb_matches = nb_matches
      @player_elo = player_elo
      @opponent_elo = opponent_elo
    end

    def development_coefficient
      Entity::CreateEntityWithContract
        .new(contract: COEFFICIENT_CONTRACT.call(coefficient: DEFAULT_COEFFICIENT.call(nb_matches: @nb_matches, elo: @player_elo)))
        .call(entity: COEFFICIENT_ENTITY)
    end

    def probability_of_win
      Entity::CreateEntityWithContract
        .new(contract: PROBABILITY_CONTRACT.call(probability: DEFAULT_WIN_PROBABILITY.call(difference_of_elo: @player_elo - @opponent_elo)))
        .call(entity: PROBABILITY_ENTITY)
    end
  end
end
