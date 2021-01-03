# frozen_string_literal: true

module Elos
  class CreatePlayer
    CONTRACT = Contracts::Player.new
    ENTITY = Entities::Player

    def initialize(information:, coefficient:, probability:)
      @information = information
      @coefficient = coefficient
      @probability = probability
    end

    def call
      Entity::CreateEntityWithContract
        .new(contract: CONTRACT.call(information: @information, development_coefficient: @coefficient, probability_of_win: @probability))
        .call(entity: ENTITY)
    end
  end
end
