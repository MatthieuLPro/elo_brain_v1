# frozen_string_literal: true

# TODO: Depuis cette class on devrait pouvoir fetch
# des events a partir de n'importe quelle API
# Elle est ici orienté QUE pour SmashGg ==> Erreurs
module Tournaments
  class FetchEventsFromApi
    DEFAULT_QUERY = ApiQueries::SmashGg::EventFromTournament
    DEFAULT_API = ApiCall::SmashGg.new
    DEFAULT_EVENTS_FROM_API = Events::Collections::EventsFromApi
    def initialize(api: DEFAULT_API, query: DEFAULT_QUERY)
      @api = api
      @query = query
    end

    def call(tournaments:)
      tournaments.map do |tournament|
        DEFAULT_EVENTS_FROM_API.new(api: @api, query: @query).call(events: tournament.events)
      end
    end
  end
end
