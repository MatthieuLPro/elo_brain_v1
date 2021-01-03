# frozen_string_literal: true

module EventAnalyser
  class MatchesCollection
    MATCH_NODE = 'displayScore'
    MATCH_DATE = 'completedAt'

    def initialize(event_id:, event_matches:)
      @event_id = event_id
      @event_matches = event_matches
    end

    def call
      # TODO: Should remove reverse here and sort matches in query
      @event_matches.reverse.each do |match|
        next unless Matches::MatchExist.new.call(match_information: match[MATCH_NODE])

        display_score = Regex::DisplayScore.new.call(expression: match[MATCH_NODE])
        match_result = MatchAnalyser::CreateResult.new.call(display_score: display_score)
        match_date = match_completed_date(match)
        current_match = MatchesRepo.new.create_from(
          event_id: @event_id,
          winner_id: match_result.winner_id,
          looser_id: match_result.looser_id,
          completed_at: match_date
        )
        MatchAnalyser::CreateElos.new(match_result: match_result, match_id: current_match.id).call
      end
    end

    private

    def match_completed_date(match_information)
      Time.at(match_information[MATCH_DATE])
    end
  end
end
