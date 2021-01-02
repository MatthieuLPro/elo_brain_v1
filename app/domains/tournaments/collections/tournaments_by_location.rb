# frozen_string_literal: true

module Tournaments
  module Collections
    class TournamentsByLocation
      TOURNAMENTS_KEY = 'nodes'

      # TODO: Use dig method for key_searcher
      # TODO: Rename smash_gg_data by api_data
      # TODO: Add tournaments_key in default value with initialize
      def format(key_searcher: JSON::KeySearcher, api_data:)
        tournaments = key_searcher.new(json: api_data).call(key: TOURNAMENTS_KEY)
        tournaments.map do |tournament|
          Tournaments::Tournament.from_json(tournament)
        end.sort_by(&:start_at)
      end
    end
  end
end
