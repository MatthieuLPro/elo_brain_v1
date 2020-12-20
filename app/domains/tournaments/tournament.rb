# frozen_string_literal: true

module Tournaments
  class Tournament < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :city, Types::Strict::String
    attribute :start_at, Types::Strict::Integer
    attribute :events, Types::Strict::Array

    def self.from_json(tournament)
      new(
        name: tournament['name'],
        city: tournament['city'],
        start_at: tournament['startAt'],
        events: tournament['events']
      )
    end
  end
end
