# frozen_string_literal: true

module Matches
  class CreateMatch
    DEFAULT_REPO = MatchesRepo.new

    def initialize(repo: DEFAULT_REPO)
      @repo = repo
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
      # This regex is smashGg oriented
      # The score should be regex before call in this class
      score = Regex::DisplayScore.new.call(expression: match_information)
      new_match = Entity::CreateEntityWithContract.new(contract: match_contract(score))
                                                  .call(entity: Matches::Entities::Match)
      Matches::CreateResult.new.call(match: new_match)
    end

    def match_contract(score)
      Matches::Contracts::Match.new.call(player1_name: score[:player1_name],
                                         player1_score: score[:player1_score],
                                         player2_name: score[:player2_name],
                                         player2_score: score[:player2_score])
    end

    def match_completed_date(match_information)
      Time.at(match_information)
    end
  end
end
