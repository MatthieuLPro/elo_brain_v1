# frozen_string_literal: true

# TODO: Remove this and replace with create_entity_with_contract class
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
