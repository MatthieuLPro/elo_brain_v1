# frozen_string_literal: true

module SmashGgFetching
  class Events
    QUERY = Queries::EventByTournament
    API_TO_FETCH = SmashGgFetching::FetchDataFromSmashGg.new

    def initialize(events:)
      @events = events
    end

    def call
      @events.map do |event|
        next unless event['numEntrants'].positive?

        query = create_query_for_api(event['id'])
        smash_gg_data = fetch_data_from_api(query)
        create_object_from_data(smash_gg_data)
      end.compact
    end

    private

    def create_query_for_api(id)
      QUERY.new.call(id: id)
    end

    def fetch_data_from_api(query)
      API_TO_FETCH.call(query: query)
    end

    def create_object_from_data(data)
      SmashGgFetching::CreateObjectsCollection.new.call(
        collection_type: ::Events::Collections::EventsById.new, query_result: data
      )
    end
  end
end
