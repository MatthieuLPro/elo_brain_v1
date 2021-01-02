# frozen_string_literal: true

module Alpha
  module Entities
    class Game < Dry::Struct
      attribute :id, Types::Strict::String

      def self.from_contract(contract:)
        new(
          id: contract[:game_id]
        )
      end
    end
  end
end
