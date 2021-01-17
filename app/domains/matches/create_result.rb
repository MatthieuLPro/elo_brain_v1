# frozen_string_literal: true

module Matches
  class CreateResult
    def call(match:)
      player1 = create_player(match.player1_name, match.player1_score)
      player2 = create_player(match.player2_name, match.player2_score)
      player_roles = player_role(player1, player2)
      Entity::CreateEntityWithContract.new(contract: AdaptedContracts::Result.new.call(winner_id: player_roles.winner_id, looser_id: player_roles.looser_id))
                                      .call(entity: Matches::Entities::Result)
    end

    private

    def create_player(name, score)
      # TODO: Create the player in other class
      # Should create player before create match
      # Should create player after regex displayScore
      player_id = Players::FindOrCreate.new.call(name: name).id
      player_score = score
      Entity::CreateEntityWithContract.new(contract: AdaptedContracts::PlayerResult.new.call(id: player_id, score: player_score))
                                      .call(entity: Matches::Entities::PlayerResult)
    end

    def player_role(player1, player2)
      Matches::PlayerRole.new(player1: player1, player2: player2)
    end
  end
end
