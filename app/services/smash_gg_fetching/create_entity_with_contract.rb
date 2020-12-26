# frozen_string_literal: true

module SmashGgFetching
  class CreateEntityWithContract
    def initialize(contract:, adapter: nil)
      @contract = contract
      @adapter = adapter
    end

    def call(entity:)
      adapted_contract = Contracts::AdaptedContract
                         .new(adapter: @adapter)
                         .call(contract: @contract)
      entity.from_contract(contract: adapted_contract)
    end
  end
end
