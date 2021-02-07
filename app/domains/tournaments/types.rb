# frozen_string_literal: true

module Tournaments
  module Types
    include Dry.Types()

    Tournament = Types.Instance(::Tournaments::Tournament)
    Event = Types.Instance(::Events::Event)
    EventSmashGg = Types.Instance(::Tournaments::Adaptors::SmashGg::Event)
  end
end
