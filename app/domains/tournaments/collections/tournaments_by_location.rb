# frozen_string_literal: true

module Tournaments
  module Collections
    class TournamentsByLocation
      TOURNAMENTS_KEY = 'tournaments'
      NODES_KEY = 'nodes'

      def format(key_searcher: JSON::KeySearcher, smash_gg_data:)
        tournaments = key_searcher.new(json: smash_gg_data.as_json).call(key: TOURNAMENTS_KEY)
        nodes = key_searcher.new(json: tournaments).call(key: NODES_KEY)

        nodes.map do |node|
          Tournaments::Tournament.from_json(node)
        end
      end
    end
  end
end
