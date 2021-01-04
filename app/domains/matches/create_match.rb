# frozen_string_literal: true

# TODO: SmashGg oriented (DisplayScore)
module Matches
  class CreateMatch
    DEFAULT_REPO = MatchesRepo.new
    DEFAULT_CREATOR = Matches::CreateResult.new

    def initialize(repo: DEFAULT_REPO, creator: DEFAULT_CREATOR)
      @repo = repo
      @creator = creator
    end

    def call(match_date:, match_score:, event_id:)
      date = match_completed_date(match_date)
      score = match_score(match_score)
      @repo.create_from(
        event_id: event_id,
        winner_id: score.winner_id,
        looser_id: score.looser_id,
        completed_at: date
      )
    end

    private

    def match_score(match_information)
      score = Regex::DisplayScore.new.call(expression: match_information)
      @creator.call(display_score: score)
    end

    def match_completed_date(match_information)
      Time.at(match_information)
    end
  end
end
