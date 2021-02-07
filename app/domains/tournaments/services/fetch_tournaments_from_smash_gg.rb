# frozen_string_literal: true

module Tournaments
  module Services
    class FetchTournamentsFromSmashGg
      def call
        tournaments = ::SmashGg::Services::FetchTournaments.new.call
        tournaments = create_tournament_with_events(tournaments)
        tournaments = create_tournament_with_events_with_matches(tournaments)
      end

      private

      def create_tournament_with_events(tournaments)
        tournaments.map do |tournament|
          events = tournament.events.map do |event|
            ::SmashGg::Services::FetchEvent.new.call(event_id: event['id'])
          end

          # Condition do not create tournament with event if event does not exist
          next if events.first.nil?

          ::Tournaments::Entity.new(name: tournament.name, city: tournament.city, start_at: tournament.start_at,
                                    events: events)
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
