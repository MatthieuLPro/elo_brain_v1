# frozen_string_literal: true

module Tournamentsv2
  module Services
    class FetchNewTournamentsFromSmashGg
      def call
        tournaments = ::SmashGgv2::Services::FetchTournaments.new.call
        tournaments.map do |tournament|
          tournament.events.map do |event|
            ::SmashGgv2::Services::FetchEvent.new.call(event_id: event['id'])
          end
        end
      end
    end
  end
end
