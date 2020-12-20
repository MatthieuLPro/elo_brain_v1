# frozen_string_literal: true

module Tournaments
  module Collections
    class TournamentsByLocation
      TOURNAMENTS_KEY = 'nodes'

      def format(key_searcher: JSON::KeySearcher, smash_gg_data:)
        tournaments = key_searcher.new(json: smash_gg_data.as_json).call(key: TOURNAMENTS_KEY)
        tournaments.map do |tournament|
          Tournaments::Tournament.from_json(tournament)
        end.sort_by(&:start_at)
      end
    end
  end
end
