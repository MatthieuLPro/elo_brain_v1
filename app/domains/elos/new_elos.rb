# frozen_string_literal: true

module Elos
  class NewElos
    WINNER = 'winner'
    LOOSER = 'looser'
    CONTRACT = Contracts::NewElos.new
    ENTITY = Entities::NewElos

    ELOS_CONSTANTES = ::Elos::Constantes

    def initialize(winner_information:, looser_information:)
      @winner_information = winner_information
      @looser_information = looser_information
    end

    def call
      Entity::CreateEntityWithContract
        .new(contract: CONTRACT.call(winner_elo: winner_elo, looser_elo: looser_elo))
        .call(entity: ENTITY)
    end

    private

    def winner_elo
      ::Elos::Calculator::PlayerElo
        .new(elo_after_match: Calculator::EloAfterMatch::Winner)
        .call(player: create_player(@winner_information, @looser_information))
    end

    def looser_elo
      ::Elos::Calculator::PlayerElo
        .new(elo_after_match: Calculator::EloAfterMatch::Looser)
        .call(player: create_player(@looser_information, @winner_information))
    end

    def create_player(player_information, opponent_information)
      constantes = ::Elos::Constantes.new(
        nb_matches: player_information.nb_matches,
        player_elo: player_information.current_elo,
        opponent_elo: opponent_information.current_elo
      )
      ::Elos::CreatePlayer.new(
        information: player_information,
        coefficient: constantes.development_coefficient,
        probability: constantes.probability_of_win
      ).call
    end
  end
end
