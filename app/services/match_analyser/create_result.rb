# frozen_string_literal: true

# TODO: We create a player if does not exist => Should be in different file ? YES
module MatchAnalyser
  class CreateResult
    ENTITY_WITH_CONTRACT = Entity::CreateEntityWithContract

    MATCH_CONTRACT = AdaptedContracts::Match.new
    MATCH_ENTITY = Matches::Entities::Match

    PLAYER_CONTRACT = AdaptedContracts::Player.new
    PLAYER_ENTITY = Matches::Entities::Player

    RESULT_CONTRACT = AdaptedContracts::Result.new
    RESULT_ENTITY = Matches::Entities::Result

    def call(display_score:)
      new_match = ENTITY_WITH_CONTRACT.new(contract: match_contract(display_score)).call(entity: MATCH_ENTITY)
      player1_id = ENTITY_WITH_CONTRACT.new(contract: player_contract(new_match.player1_name, new_match.player1_score)).call(entity: PLAYER_ENTITY).id
      player2_id = ENTITY_WITH_CONTRACT.new(contract: player_contract(new_match.player2_name, new_match.player2_score)).call(entity: PLAYER_ENTITY).id
      ENTITY_WITH_CONTRACT.new(contract: result_contract(player1_id, player2_id)).call(entity: RESULT_ENTITY)
    end

    private

    def result_contract(winner_id, looser_id)
      RESULT_CONTRACT.call(winner_id: winner_id, looser_id: looser_id)
    end

    def match_contract(display_score)
      MATCH_CONTRACT.call(player1_name: display_score[:player1_name],
                          player1_score: display_score[:player1_score],
                          player2_name: display_score[:player2_name],
                          player2_score: display_score[:player2_score])
    end

    # TODO: See Top TODO
    def player_contract(name, score)
      PLAYER_CONTRACT.call(id: Players::FindOrCreate.new.call(name: name), name: name, score: score)
    end
  end
end
