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
      @event_matches.each do |match|
        next unless match_exist(match[MATCH_NODE])

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

    def match_exist(match_information)
      Matches::RunConditions.new(
        Matches::Conditions::DoesNotExist.new(match_information: match_information),
        Matches::Conditions::NotPlayed.new(match_information: match_information)
      ).is_played?
    end

    def match_completed_date(match_information)
      Time.at(match_information[MATCH_DATE])
    end
  end
end
