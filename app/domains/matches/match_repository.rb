# frozen_string_literal: true

# TODO: Remove those functions into repositories file
module Matches
  class MatchRepository
    def create(event_id:, winner_id:, looser_id:)
      ::Match.create(event_id: event_id, winner_id: winner_id, looser_id: looser_id)
    end

    def nb_matches_by_elos(elos_collection:)
      elos_collection.count
    end
  end
end
