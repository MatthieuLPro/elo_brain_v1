# frozen_string_literal: true

class UpdateTournamentsJob < ApplicationJob
  EMPTY_DATA = 'Data is empty'
  def perform(place, radius, game)
    tournaments = SmashGgFetching::Tournaments.new.call(
      place: place,
      radius: radius,
      game: game
    )
    return EMPTY_DATA if tournaments.empty?

    EventAnalyser::EventsCollectionPerTournament.new(
      tournaments: SmashGgFetching::CreateEventsFromTournament.new.call(tournaments: tournaments)
    ).call
  end
end
