# frozen_string_literal: true

module Events
  class CreateEvent
    REPOSITORY = EventsRepo.new
    MATCHES_COLLECTION = Matches::CreateMatchesFromEvent.new

    def call(events_collection:)
      events_collection.each do |event|
        ar_event = create_event(event.id.to_s)
        MATCHES_COLLECTION.call(event_id: ar_event.id, event_matches: event.matches)
      end
    end

    private

    def create_event(name)
      REPOSITORY.create_by(name: name)
    end
  end
end
