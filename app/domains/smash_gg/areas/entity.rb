# frozen_string_literal: true

module SmashGg
  module Areas
    class Entity < Dry::Struct
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
