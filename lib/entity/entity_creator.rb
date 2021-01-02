# frozen_string_literal: true

module Entity
  class EntityCreator
    def initialize(entity:)
      @entity = entity
    end

    def call(adapted_contract:)
      @entity.from_contract(contract: adapted_contract)
    end
  end
end
