# frozen_string_literal: true

module EventAnalyser
  class EventsCollection
    REPOSITORY = EventsRepo.new
    MATCHES_COLLECTION = EventAnalyser::MatchesCollection

    def initialize(events_collection:)
      @events_collection = events_collection
    end

    def call
      @events_collection.each do |event|
        ar_event = create_event(event.id.to_s)
        MATCHES_COLLECTION.new(
          event_id: ar_event.id,
          event_matches: event.matches
        ).call
      end
    end

    private

    def create_event(name)
      REPOSITORY.create_by(name: name)
    end
  end
end
