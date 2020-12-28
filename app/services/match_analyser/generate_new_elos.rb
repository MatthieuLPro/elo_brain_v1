# frozen_string_literal: true

module MatchAnalyser
  class GenerateNewElos
    REPOSITORY = Elos::EloRepository.new
    MATCH_CONSEQUENCES = Matches::Consequences
    def initialize(match_result:, match_id:)
      @match_result = match_result
      @match_id = match_id
    end

    def call
      consequences = MATCH_CONSEQUENCES.new(result: @match_result).call
      REPOSITORY.create(player_id: @match_result.winner_id, level: consequences[:winner], match_id: @match_id)
      REPOSITORY.create(player_id: @match_result.looser_id, level: consequences[:looser], match_id: @match_id)
    end
  end
end
