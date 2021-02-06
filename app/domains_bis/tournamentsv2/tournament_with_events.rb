# frozen_string_literal: true

module Tournamentsv2
  class TournamentWithEvents < Dry::Struct
    attribute :tournament, Types::Tournament
    attribute :events, Types::Array(Types::Event)
  end
end
