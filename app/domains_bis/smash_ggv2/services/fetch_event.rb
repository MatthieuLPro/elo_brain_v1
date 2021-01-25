# frozen_string_literal: true

module SmashGgv2
  module Services
    class FetchEvent
      API = ApiCall::SmashGg.new

      def call(event_id:)
        query = ::SmashGgv2::ApiQueries::EventById.new.call(event_id: event_id)
        ::Eventsv2::EventsRepository.new.from_smash_gg(query: query)
      end
    end
  end
end
