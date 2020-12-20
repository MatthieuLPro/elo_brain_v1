# frozen_string_literal: true

module Events
  class Event < Dry::Struct
    attribute :id, Types::Strict::Integer
    attribute :number_entrants, Types::Strict::Integer
    attribute :matches, Types::Strict::Array

    def self.from_json(event)
      new(
        id: event['id'],
        number_entrants: event['numEntrants'],
        matches: event['sets']['nodes']
      )
    end
  end
end
