# frozen_string_literal: true

module SmashGgFetching
  module EventByTournament
    class CreateQuery
      PER_PAGE = 200

      def call(id:)
        query_parameters = create_query_parameters(
          SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Id.new.call(number: id))
                                                   .call(entity: Alpha::Entities::Id)
        )
        Alpha::Queries::Events::ById.new.call(params: query_parameters)
      end

      private

      def create_query_parameters(id)
        Alpha::Parameters::Events::ById.new(
          per_page: PER_PAGE,
          id: id.number
        )
      end
    end
  end
end
