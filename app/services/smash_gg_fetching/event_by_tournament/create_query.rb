# frozen_string_literal: true

module SmashGgFetching
  module EventByTournament
    class CreateQuery
      PER_PAGE = 200

      def call(id:)
        query_parameters = create_query_parameters(
          create_id_object(id)
        )
        Alpha::Queries::Events::ById.new.call(params: query_parameters)
      end

      private

      def create_id_object(id)
        adapted_contract = Alpha::Contracts::AdaptedContract.new.call(
          contract: Alpha::Contracts::Id.new.call(number: id),
          adaptator: Alpha::Contracts::Adaptators::Standard
        )
        Alpha::Id.from_contract_data(adapted_contract)
      end

      def create_query_parameters(id)
        Alpha::Parameters::Events::ById.new(
          per_page: PER_PAGE,
          id: id.number
        )
      end
    end
  end
end
