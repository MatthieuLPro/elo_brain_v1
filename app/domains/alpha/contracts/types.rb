# frozen_string_literal: true

module Alpha
  module Contracts
    module Types
      include Dry::Types()

      IdEntity = Types.Instance(Alpha::Entities::Id)
      AreaEntity = Types.Instance(Alpha::Entities::Area)
      DatesRangeEntity = Types.Instance(Alpha::Entities::DatesRange)
      GameEntity = Types.Instance(Alpha::Entities::Game)
    end
  end
end
