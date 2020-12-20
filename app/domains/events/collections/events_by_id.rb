# frozen_string_literal: true

module Events
  module Collections
    class EventsById
      EVENT_KEY = 'event'

      def format(key_searcher: JSON::KeySearcher, smash_gg_data:)
        event = key_searcher.new(json: smash_gg_data.as_json).call(key: EVENT_KEY)
        Events::Event.from_json(event)
      end
    end
  end
end
