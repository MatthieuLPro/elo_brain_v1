# frozen_string_literal: true

module Matches
  module Entities
    class Result < Dry::Struct
      attribute :winner_id, Types::Strict::Integer
      attribute :looser_id, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          winner_id: contract[:winner_id],
          looser_id: contract[:looser_id]
        )
      end
    end
  end
end
