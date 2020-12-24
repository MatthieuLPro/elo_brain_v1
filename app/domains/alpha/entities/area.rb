# frozen_string_literal: true

module Alpha
  module Entities
    class Area < Dry::Struct
      attribute :coordinates, Types::Strict::String
      attribute :radius, Types::Strict::String

      def self.from_contract(contract:)
        new(
          coordinates: contract[:coordinates],
          radius: contract[:radius]
        )
      end
    end
  end
end
