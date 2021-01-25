# frozen_string_literal: true

module Eventsv2
  class Entity < Dry::Struct
    attribute :id, Types::Strict::Integer
    attribute :number_entrants, Types::Strict::Integer
    attribute :matches, Types::Strict::Array
  end
end
