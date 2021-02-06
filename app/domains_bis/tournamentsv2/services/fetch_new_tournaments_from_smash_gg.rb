# frozen_string_literal: true

module Tournamentsv2
  module Services
    class FetchNewTournamentsFromSmashGg
      def call
        tournaments = ::SmashGgv2::Services::FetchTournaments.new.call
        tournaments = create_tournmanent_with_events(tournaments)
        tournaments = create_tournament_with_events_with_matches(tournaments)
      end

      private

      def create_tournmanent_with_events(tournaments)
        tournaments.map do |tournament|
          events = tournament.events.map do |event|
            ::SmashGgv2::Services::FetchEvent.new.call(event_id: event['id'])
          end

          # Condition do not create tournament with event if event does not exist
          next if events.first.nil?

          ::Tournamentsv2::Entity.new(name: tournament.name, city: tournament.city, start_at: tournament.start_at, events: events)
        end.compact
      end

      def create_tournament_with_events_with_matches(tournaments)
        # TODO: Format matches to be understand by calculations
        # tournaments.map do |tournament|
        #   tournament.events.map do |event|
        #     event.matches
        #   end
        # end
      end
    end
  end
end
