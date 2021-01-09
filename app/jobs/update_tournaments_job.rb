# frozen_string_literal: true

class UpdateTournamentsJob < ApplicationJob
  EMPTY_DATA = 'Data is empty'
  def perform(place, radius, game)
    coordinates = ::SmashGg::CreateCoordinates.new.call(place: place)
    radius = ::SmashGg::CreateRadius.new.call(radius: radius)
    game_id = ::SmashGg::CreateGame.new.call(game: game)
    query = ApiQueries::SmashGg::TournamentFromGameLocationDate.new(coordinates: coordinates, radius: radius, game_id: game_id).call
    tournaments = Tournaments::Collections::TournamentsFromSmashGg.new.call(query: query)
    return EMPTY_DATA if tournaments.empty?

    tournaments_with_events = Tournaments::FetchEventsFromApi.new.call(tournaments: tournaments)
    Tournaments::CreateEvents.new.call(tournaments: tournaments_with_events)
  end
end
