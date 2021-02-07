# frozen_string_literal: true

module Elos
  class CreateNewElos
    def call(winner_information:, looser_information:)
      player1 = create_player(winner_information.current_elo, winner_information.nb_matches, 'winner')
      player2 = create_player(looser_information.current_elo, looser_information.nb_matches, 'looser')
      new_elos = EloBrain::Matches::Match.from(player1: player1, player2: player2).calculate_new_elos
      contract = Elos::Contract.new.call(winner_elo: new_elos[:player1_new_elo], looser_elo: new_elos[:player2_new_elo])
      Elos::NewElos.from_contract(contract: contract)
    end

    private

    def create_player(elo, nb_matches, situation)
      EloBrain::Players::Player.from(
        elo: elo,
        nb_matches: nb_matches,
        situation: situation
      )
    end
  end
end
