# frozen_string_literal: true

module SmashGgFetching
  class Tournaments
    QUERY = Queries::TournamentByGameLocationDate
    API_TO_FETCH = SmashGgFetching::FetchDataFromSmashGg.new

    def call(place:, radius:, game:)
      query = create_query_for_api(place, radius, game)
      smash_gg_data = fetch_data_from_api(query)
      create_object_from_data(smash_gg_data)
    end

    private

    def create_query_for_api(place, radius, game)
      QUERY.new.call(place: place, radius: radius, game: game)
    end

    def fetch_data_from_api(query)
      API_TO_FETCH.call(query: query)
    end

    def create_object_from_data(data)
      SmashGgFetching::CreateObjectsCollection.new.call(
        collection_type: ::Tournaments::Collections::TournamentsByLocation.new, query_result: data
      )
    end
  end
end
