# frozen_string_literal: true

module EventAnalyser
  class CreateEventsFromTournament
    def call(tournaments:)
      tournaments.map do |tournament|
        EventAnalyser::CreateCollectionFromApi.new(events: tournament.events).call
      end
    end
  end
end
