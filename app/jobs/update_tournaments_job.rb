# frozen_string_literal: true

class UpdateTournamentsJob < ApplicationJob
  EMPTY_DATA = 'Data is empty'
  def perform(place, radius, game)
    query = ApiQueries::SmashGg::TournamentFromGameLocationDate.new.call(place: place, radius: radius, game: game)
    tournaments = Tournaments::Collections::TournamentsFromApi.new.call(query: query)
    return EMPTY_DATA if tournaments.empty?

    tournaments_with_events = Tournaments::FetchEventsFromApi.new.call(tournaments: tournaments)
    Tournaments::CreateEvents.new.call(tournaments: tournaments_with_events)
  end
end
