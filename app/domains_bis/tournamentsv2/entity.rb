# frozen_string_literal: true

module Tournamentsv2
  class Entity < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :city, Types::Strict::String
    attribute :start_at, Types::Strict::Integer
    attribute :events, Types::Strict::Array
  end
end
