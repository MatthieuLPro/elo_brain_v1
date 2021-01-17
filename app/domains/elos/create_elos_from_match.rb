# frozen_string_literal: true

module Elos
  class CreateElosFromMatch
    DEFAULT_MATCH_RESULTS = Matches::Results.new

    def initialize(match_results: DEFAULT_MATCH_RESULTS)
      @match_results = match_results
    end

    def call(match:)
      match_results = @match_results.call(result: match)
      create_elo_from_repo(match.winner_id, match_results.winner, match.id)
      create_elo_from_repo(match.looser_id, match_results.looser, match.id)
    end

    private

    def create_elo_from_repo(player_id, level, match_id)
      ElosRepo.new.create_from(player_id: player_id, level: level, match_id: match_id)
    end
  end
end
