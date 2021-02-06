# frozen_string_literal: true

module Tournamentsv2
  module Types
    include Dry.Types()

    Tournament = Types.Instance(::Tournamentsv2::Entity)
    Event = Types.Instance(::Eventsv2::Entity)
  end
end
