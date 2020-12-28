# frozen_string_literal: true

class UpdateTournamentsJob < ApplicationJob
  def perform(place, radius, game)
    tournaments = SmashGgFetching::Tournaments.new.call(
      place: place,
      radius: radius,
      game: game
    )
    EventAnalyser::EventsCollectionPerTournament.new(
      tournaments: SmashGgFetching::CreateEventsFromTournament.new.call(tournaments: tournaments)
    ).call
  end
end
