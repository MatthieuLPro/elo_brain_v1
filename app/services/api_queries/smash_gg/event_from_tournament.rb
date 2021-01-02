# frozen_string_literal: true

module ApiQueries
  module SmashGg
    class EventFromTournament
      PER_PAGE = 99

      def call(id:)
        query_parameters = create_query_parameters(
          Entity::CreateEntityWithContract.new(contract: ::SmashGg::Contracts::Id.new.call(number: id))
                                                   .call(entity: ::SmashGg::Entities::Id)
        )
        ::SmashGg::Queries::EventsById.new.call(params: query_parameters)
      end

      private

      def create_query_parameters(id)
        Entity::CreateEntityWithContract.new(
          contract: ::SmashGg::Contracts::EventParameters.new
                                                     .call(events_per_page: PER_PAGE, event_id: id)
        )
                                        .call(entity: ::SmashGg::Entities::EventParameters)
      end
    end
  end
end
