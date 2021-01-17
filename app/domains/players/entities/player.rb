# frozen_string_literal: true

module Players
  module Entities
    class Player < Dry::Struct
      attribute :id, Types::Strict::Integer
      attribute :name, Types::Strict::String

      def self.from_ar(datum:)
        new(
          id: datum.id,
          name: datum.name
        )
      end
    end
  end
end
