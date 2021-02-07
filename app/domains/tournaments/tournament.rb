# frozen_string_literal: true

module Tournaments
  class Tournament < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :city, Types::Strict::String
    attribute :start_at, Types::Strict::Integer
    attribute :events, Types::Array(Types::Event | Types::EventSmashGg)
  end
end
