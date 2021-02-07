# frozen_string_literal: true

module Tournaments
  module Adaptors
    class SmashGg
      attr_accessor :name, :city, :start_at, :events

      def initialize(tournament:)
        @tournament = tournament
      end

      def adapt
        self.name = @tournament['name']
        self.city = @tournament['city']
        self.start_at = @tournament['startAt']
        self.events = @tournament['events'].pluck('id').map { |id| Event.new.adapt(id: id) }
        self
      end

      class Event
        attr_accessor :id

        def adapt(id:)
          self.id = id
          self
        end
      end
    end
  end
end
