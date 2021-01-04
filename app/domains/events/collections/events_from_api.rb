# frozen_string_literal: true

# TODO: Cette class est trop spécifique a SmashGg
# Soit rename cette class en EventsFromSmashGg
# ou écrire une classe généraliste
module Events
  module Collections
    class EventsFromApi
      NUMBER_PLAYERS = 'numEntrants'
      EVENT_ID = 'id'

      def initialize(api:, query:)
        @api = api
        @query = query
      end

      def call(events:)
        events.map do |event|
          next unless event[NUMBER_PLAYERS].positive?

          query = api_query(event[EVENT_ID])
          events_from_api = api_call(query)
          create_collection(events_from_api)
        end.compact
      end

      private

      def api_query(id)
        @query.new.call(id: id)
      end

      def api_call(query)
        @api.call(query: query)
      end

      def create_collection(events)
        Collection::LaunchFormatWithData.new.call(
          collection_type: ::Events::Collections::EventsById.new, data: events
        )
      end
    end
  end
end
