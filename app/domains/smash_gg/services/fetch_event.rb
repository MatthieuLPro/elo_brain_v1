# frozen_string_literal: true

module SmashGg
  module Services
    class FetchEvent
      API = ApiCall::SmashGg.new

      def call(event_id:)
        query = ::SmashGg::ApiQueries::EventById.new.call(event_id: event_id)
        ::Events::EventsRepository.new.from_smash_gg(query: query)
      end
    end
  end
end
