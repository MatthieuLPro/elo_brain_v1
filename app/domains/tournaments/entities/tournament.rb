# frozen_string_literal: true

module Tournaments
  module Entities
    class Tournament < Dry::Struct
      attribute :name, Types::Strict::String
      attribute :city, Types::Strict::String
      attribute :start_at, Types::Strict::Integer
      attribute :events, Types::Strict::Array

      # We do not use the method .from_contract because
      # the values come from api request
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
end
