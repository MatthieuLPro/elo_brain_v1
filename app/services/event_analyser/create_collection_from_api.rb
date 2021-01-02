# frozen_string_literal: true

module EventAnalyser
  class CreateCollectionFromApi
    QUERY = ApiQueries::SmashGg::EventFromTournament
    API_TO_FETCH = ApiCall::SmashGg.new

    def initialize(events:)
      @events = events
    end

    def call
      @events.map do |event|
        next unless event['numEntrants'].positive?

        query = api_query(event['id'])
        api_data = api_data(query)
        create_collection(api_data)
      end.compact
    end

    private

    def api_query(id)
      QUERY.new.call(id: id)
    end

    def api_data(query)
      API_TO_FETCH.call(query: query)
    end

    def create_collection(data)
      Collection::LaunchFormatWithData.new.call(
        collection_type: ::Events::Collections::EventsById.new, data: data
      )
    end
  end
end
