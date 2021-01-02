# frozen_string_literal: true

module SmashGg
  module Entities
    class Id < Dry::Struct
      attribute :number, Types::Strict::Integer

      def self.from_contract(contract:)
        new(
          number: contract[:number]
        )
      end
    end
  end
end
