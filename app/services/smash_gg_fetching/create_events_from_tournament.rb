# frozen_string_literal: true

module SmashGgFetching
  class CreateEventsFromTournament
    def call(tournaments:)
      tournaments.map do |tournament|
        SmashGgFetching::Events.new(events: tournament.events).call
      end
    end
  end
end
