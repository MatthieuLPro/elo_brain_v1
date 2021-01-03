# frozen_string_literal: true

module Players
  module Entities
    class Information < Dry::Struct
      attribute :id, Types::Strict::Integer
      attribute :nb_matches, Types::Strict::Integer
      attribute :current_elo, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          id: contract[:id],
          nb_matches: contract[:nb_matches],
          current_elo: contract[:current_elo]
        )
      end
    end
  end
end
