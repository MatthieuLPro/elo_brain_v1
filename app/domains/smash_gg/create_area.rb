# frozen_string_literal: true

module SmashGg
  class CreateArea
    CONTRACT = Contracts::Area.new
    ENTITY = Entities::Area

    def initialize(place:, radius:)
      @place = place
      @radius = radius
    end

    def call
      Entity::CreateEntityWithContract
        .new(contract: CONTRACT.call(information: @information, development_coefficient: @coefficient, probability_of_win: @probability))
        .call(entity: ENTITY)
    end
  end
end
