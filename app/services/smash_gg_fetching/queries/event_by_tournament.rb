# frozen_string_literal: true

module SmashGgFetching
  module Queries
    class EventByTournament
      PER_PAGE = 99

      def call(id:)
        query_parameters = create_query_parameters(
          SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Id.new.call(number: id))
                                                   .call(entity: Alpha::Entities::Id)
        )
        Alpha::Queries::EventsById.new.call(params: query_parameters)
      end

      private

      def create_query_parameters(id)
        SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::EventParameters
                                                                  .new
                                                                  .call(events_per_page: PER_PAGE, event_id: id))
                                                 .call(entity: Alpha::Entities::EventParameters)
      end
    end
  end
end
