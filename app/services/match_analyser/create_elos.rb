# frozen_string_literal: true

# TODO: Add Repository and match's consequences into initialize
# TODO: Add match_result and match_id into call
module MatchAnalyser
  class CreateElos
    REPOSITORY = ElosRepo.new
    MATCH_CONSEQUENCES = Matches::Consequences
    def initialize(match_result:, match_id:)
      @match_result = match_result
      @match_id = match_id
    end

    def call
      consequences = MATCH_CONSEQUENCES.new(result: @match_result).call
      REPOSITORY.create_from(player_id: @match_result.winner_id, level: consequences.winner, match_id: @match_id)
      REPOSITORY.create_from(player_id: @match_result.looser_id, level: consequences.looser, match_id: @match_id)
    end
  end
end
