# frozen_string_literal: true

module Events
  module Collections
    class EventsById
      EVENT_KEY = 'event'
      DEFAULT_ENTITY = Events::Entities::Event
      def initialize(entity: DEFAULT_ENTITY)
        @entity = entity
      end

      def format(key_searcher: JSON::KeySearcher, api_data:)
        event = key_searcher.new(json: api_data.as_json).call(key: EVENT_KEY)
        @entity.from_json(event)
      end
    end
  end
end
