# frozen_string_literal: true

module Matches
  class Match < Dry::Struct
    attribute :winner, Types::Strict::Integer
    attribute :looser, Types::Strict::Integer
  end
end
