# frozen_string_literal: true

module Tournaments
  class TournamentWithEvents < Dry::Struct
    attribute :tournament, Types::Tournament
    attribute :events, Types::Array(Types::Event)
  end
end
