# frozen_string_literal: true

module Tournaments
  class CreateEvents
    DEFAULT_EVENT_CREATOR = Events::CreateEvent.new
    def initialize(event_creator: DEFAULT_EVENT_CREATOR)
      @event_creator = event_creator
    end

    def call(tournaments:)
      tournaments.each do |list_events|
        @event_creator.call(events_collection: list_events)
      end
    end
  end
end
