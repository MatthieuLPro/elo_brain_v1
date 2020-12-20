# frozen_string_literal: true

module SmashGgFetching
  class Events
    def initialize(events:)
      @events = events
    end

    def call
      @events.map do |event|
        next unless event['numEntrants'].positive?

        query = EventByTournament::CreateQuery.new.call(id: event['id'])
        smash_gg_data = SmashGgFetching::FetchDataFromSmashGg.new.call(query: query)
        SmashGgFetching::CreateObjectsCollection.new.call(collection_type: ::Events::Collections::EventsById.new, query_result: smash_gg_data)
      end.compact
    end
  end
end
