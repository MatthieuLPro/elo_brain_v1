# frozen_string_literal: true

module MatchAnalyser
  class GenerateMatchResult
    ENTITY_CREATOR = MatchAnalyser::EntityCreator
    ADAPTED_CONTRACT_CREATOR = AdaptedContracts::Creator
    def call(display_score:)
      new_match = ENTITY_CREATOR
                  .new(entity: Matches::Entities::Match)
                  .call(adapted_contract: match_adapted_contract(display_score))

      ENTITY_CREATOR.new(entity: Matches::Entities::Result)
                    .call(adapted_contract: result_adapted_contract(
                      ENTITY_CREATOR.new(entity: Matches::Entities::Player).call(adapted_contract: player_adapted_contract(new_match.player1_name, new_match.player1_score)).id,
                      ENTITY_CREATOR.new(entity: Matches::Entities::Player).call(adapted_contract: player_adapted_contract(new_match.player2_name, new_match.player2_score)).id
                    ))
    end

    private

    def result_adapted_contract(winner_id, looser_id)
      ADAPTED_CONTRACT_CREATOR.new
                              .call(contract: AdaptedContracts::Result.new
                                                                      .call(winner_id: winner_id,
                                                                            looser_id: looser_id))
    end

    def match_adapted_contract(display_score)
      ADAPTED_CONTRACT_CREATOR.new
                              .call(contract: AdaptedContracts::Match.new
                                                                     .call(player1_name: display_score[:player1_name],
                                                                           player1_score: display_score[:player1_score],
                                                                           player2_name: display_score[:player2_name],
                                                                           player2_score: display_score[:player2_score]))
    end

    def player_adapted_contract(name, score)
      ADAPTED_CONTRACT_CREATOR.new
                              .call(contract: AdaptedContracts::Player.new
                                                                       .call(
                                                                         id: Players::FindOrCreate.new.call(name: name),
                                                                         name: name,
                                                                         score: score
                                                                       ))
    end
  end
end
