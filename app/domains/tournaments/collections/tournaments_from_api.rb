# frozen_string_literal: true

# TODO: Cette class est trop spécifique a SmashGg
# Soit rename cette class en TournamentsFromSmashGg
# ou écrire une classe généraliste
module Tournaments
  module Collections
    class TournamentsFromApi
      DEFAULT_API = ApiCall::SmashGg.new

      def initialize(api: DEFAULT_API)
        @api = api
      end

      def call(query:)
        api_data = fetch_api_data(query).as_json
        return {} unless api_data.dig('value', 'data', 'tournaments', 'nodes')

        create_collection(api_data)
      end

      private

      def fetch_api_data(query)
        @api.call(query: query)
      end

      def create_collection(data)
        Collection::LaunchFormatWithData.new.call(
          collection_type: ::Tournaments::Collections::TournamentsByLocation.new, data: data
        )
      end
    end
  end
end
