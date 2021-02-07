# frozen_string_literal: true

# TODO: Cette class est trop spécifique a SmashGg
# Soit rename cette class en CreateMatchesFromSmashGg
# ou écrire une classe généraliste
module Matches
  class CreateMatchesFromEvent
    # SmashGg values
    MATCH_SCORE = 'displayScore'
    MATCH_DATE = 'completedAt'
    def call(event_id:, event_matches:)
      # TODO: Should remove reverse here and sort matches in query
      event_matches.reverse.each do |match|
        next unless match_is_valid(match[MATCH_SCORE])

        current_match = Matches::CreateMatch.new.call(match_date: match[MATCH_DATE], match_score: match[MATCH_SCORE],
                                                      event_id: event_id)
        Elos::CreateElosFromMatch.new.call(match: current_match)
      end
    end

    private

    def match_is_valid(match_information)
      Matches::ToCalculate::MatchExist.new.call(match_information: match_information)
    end
  end
end
