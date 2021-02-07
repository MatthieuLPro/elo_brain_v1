# frozen_string_literal: true

module Tournaments
  class TournamentsRepository
    def from_smash_gg(query:)
      tournaments = ExternalApi::SmashGg::Facade.new.call(
        parameter: SmashGg::ApiParameters::Entity.new(query: query, operation_name: nil, variables: nil)
      )
      tournaments = tournaments.flatten.dig('data', 'tournaments', 'nodes').map do |tournament|
        Tournaments::Adaptors::SmashGg.new(tournament: tournament).adapt
      end
      entities(tournaments)
    end

    private

    def entities(tournaments)
      tournaments.map { |tournament| entity(tournament) }
    end

    def entity(tournament)
      Tournaments::Tournament.new(name: tournament.name, city: tournament.city, start_at: tournament.start_at,
                                  events: tournament.events)
    end
  end
end
