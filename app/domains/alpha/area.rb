# frozen_string_literal: true

module Alpha
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
    attribute :radius, Types::Strict::String.constrained(format: RADIUS_CONSTRAINED)

    def self.with_place(place:, radius: DEFAULT_RADIUS)
      new(
        coordinates: COORDINATES[place.to_sym],
        radius: radius
      )
    end
  end
end
