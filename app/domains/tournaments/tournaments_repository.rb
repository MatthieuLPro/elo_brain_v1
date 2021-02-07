# frozen_string_literal: true

module Tournaments
  class TournamentsRepository
    def from_smash_gg(query:)
      tournaments = ExternalApi::Facades::SmashGg.new.run_alpha_end_point(
        parameter: SmashGg::ApiParameters::Entity.new(query: query, operation_name: nil, variables: nil)
      )
      tournaments = tournaments.flatten.dig('data', 'tournaments', 'nodes').map do |tournament|
        {
          name: tournament['name'],
          city: tournament['city'],
          startAt: tournament['startAt'],
          events: tournament['events']
        }
      end
      entities(tournaments)
    end

    private

    def entities(tournaments)
      tournaments.map { |tournament| entity(tournament) }
    end

    def entity(tournament)
      Tournaments::Entity.new(name: tournament[:name], city: tournament[:city], start_at: tournament[:startAt],
                              events: tournament[:events])
    end
  end
end
