# frozen_string_literal: true

module SmashGg
  module Contracts
    module Types
      include Dry::Types()

      IdEntity = Types.Instance(SmashGg::Entities::Id)
      AreaEntity = Types.Instance(SmashGg::Entities::Area)
      DatesRangeEntity = Types.Instance(SmashGg::Entities::DatesRange)
      GameEntity = Types.Instance(SmashGg::Entities::Game)
    end
  end
end
