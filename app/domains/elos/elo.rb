# frozen_string_literal: true

module Elos
  class Elo < Dry::Struct
    attribute :value, Types::Strict::Integer
    attribute :match_number, Types::Strict::Integer
  end
end
