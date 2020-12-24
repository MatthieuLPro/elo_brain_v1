# frozen_string_literal: true

module Alpha
  module Entities
    class DatesRange < Dry::Struct
      attribute :before_date, Types::Strict::String
      attribute :after_date, Types::Strict::String

      def self.from_contract(contract:)
        new(
          before_date: contract[:before_date],
          after_date: contract[:after_date]
        )
      end
    end
  end
end
