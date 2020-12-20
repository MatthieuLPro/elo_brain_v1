# frozen_string_literal: true

module SmashGgFetching
  class Tournaments
    def call(place:, radius:, game:)
      query = TournamentByGameLocationDate::CreateQuery.new(place: place, radius: radius, game: game).call
      smash_gg_data = SmashGgFetching::FetchDataFromSmashGg.new.call(query: query)
      SmashGgFetching::CreateObjectsCollection.new.call(collection_type: ::Tournaments::Collections::TournamentsByLocation.new, query_result: smash_gg_data)
    end
  end
end
