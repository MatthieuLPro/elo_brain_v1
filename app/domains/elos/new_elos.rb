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
      player1 = EloBrain::Players::Player.from(
        elo: winner_information.current_elo,
        nb_matches: winner_information.nb_matches,
        situation: 'winner'
      )
      player2 = EloBrain::Players::Player.from(
        elo: looser_information.current_elo,
        nb_matches: looser_information.nb_matches,
        situation: 'looser'
      )
      new_elos = EloBrain::Matches::Match.from(player1: player1, player2: player2).calculate_new_elos

      Entity::CreateEntityWithContract
        .new(contract: CONTRACT.call(winner_elo: new_elos.player1_new_elo, looser_elo: new_elos.player2_new_elo))
        .call(entity: ENTITY)
    end
  end
end
