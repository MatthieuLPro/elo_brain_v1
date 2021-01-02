# frozen_string_literal: true

class UpdateTournamentsJob < ApplicationJob
  EMPTY_DATA = 'Data is empty'
  def perform(place, radius, game)
    query = ApiQueries::SmashGg::TournamentFromGameLocationDate.new.call(place: place, radius: radius, game: game)
    tournaments = TournamentAnalyser::CreateCollectionFromApi.new.call(query: query)
    return EMPTY_DATA if tournaments.empty?

    EventAnalyser::EventsCollectionPerTournament.new(
      tournaments: EventAnalyser::CreateEventsFromTournament.new.call(tournaments: tournaments)
    ).call
  end
end
