# frozen_string_literal: true

module Matches
  class CreateElos
    DEFAULT_ELO_CREATOR = ::Elos::CreateElo.new
    DEFAULT_MATCH_RESULTS = Matches::Results.new

    def initialize(elo_creator: DEFAULT_ELO_CREATOR, match_results: DEFAULT_MATCH_RESULTS)
      @elo_creator = elo_creator
      @match_results = match_results
    end

    def call(match:)
      match_results = @match_results.call(result: match)
      @elo_creator.call(player_id: match.winner_id, level: match_results.winner, match_id: match.id)
      @elo_creator.call(player_id: match.looser_id, level: match_results.looser, match_id: match.id)
    end
  end
end
