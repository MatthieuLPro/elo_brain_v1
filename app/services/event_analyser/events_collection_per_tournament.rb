# frozen_string_literal: true

module EventAnalyser
  class EventsCollectionPerTournament
    def initialize(tournaments:)
      @tournaments = tournaments
    end

    def call
      @tournaments.each do |list_events|
        EventAnalyser::EventsCollection.new(events_collection: list_events).call
      end
    end
  end
end
