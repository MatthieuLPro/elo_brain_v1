# frozen_string_literal: true

module Tournaments
  class Tournament < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :city, Types::Strict::String

    def self.from_json(tournament)
      new(
        name: tournament['name'],
        city: tournament['city']
      )
    end
  end
end
