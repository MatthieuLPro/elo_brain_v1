# frozen_string_literal: true

module Tournaments
  module Types
    include Dry.Types()

    Tournament = Types.Instance(::Tournaments::Entity)
    Event = Types.Instance(::Events::Entity)
  end
end
