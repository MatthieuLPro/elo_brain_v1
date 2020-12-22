# frozen_string_literal: true

module Alpha
  module Entities
    class Area < Dry::Struct
      COORDINATES = {
        paris: '48.8534,2.3488',
        lyon: '45.75,4.85',
        marseille: '43.3,5.4',
        online: 'online'
      }.freeze
      COORDINATES_CONSTRAINED = /(\A\d{1,3}\.\d{1,4},\d{1,3}\.\d{1,4}\z|online)/.freeze
      DEFAULT_RADIUS = '31mi'

      attribute :coordinates, Types::Strict::String.constrained(format: COORDINATES_CONSTRAINED)
      attribute :radius, Types::Strict::String

      def self.from_contract(contract:)
        new(
          coordinates: COORDINATES[contract[:place].to_sym],
          radius: radius_condition(contract[:radius])
        )
      end

      def self.radius_condition(value)
        return DEFAULT_RADIUS if value.empty?

        value
      end
    end
  end
end
