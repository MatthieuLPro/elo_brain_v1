# frozen_string_literal: true

# SmashGG oriented ('nodes')
module Tournaments
  module Collections
    class TournamentsByLocation
      # The value 'nodes' is specific to SmashGg
      TOURNAMENTS_KEY = 'nodes'
      DEFAULT_ENTITY = Tournaments::Entities::Tournament

      def initialize(entity: DEFAULT_ENTITY, data_key: TOURNAMENTS_KEY)
        @entity = entity
        @data_key = data_key
      end

      # TODO: Use dig method for key_searcher
      # TODO: Add tournaments_key in default value with initialize
      def format(key_searcher: JSON::KeySearcher, api_data:)
        tournaments = key_searcher.new(json: api_data).call(key: @data_key)
        tournaments.map do |tournament|
          @entity.from_json(tournament)
        end.sort_by(&:start_at)
      end
    end
  end
end
