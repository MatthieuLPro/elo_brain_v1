# frozen_string_literal: true

module Matches
  class MatchRepository
    def create(event_id:, winner_id:, looser_id:)
      ::Match.create(event_id: event_id, winner_id: winner_id, looser_id: looser_id)
    end
  end
end
