# frozen_string_literal: true

module SmashGgFetching
  class CreateEntityWithContract
    def initialize(contract:, adaptator: nil)
      @contract = contract
      @adaptator = adaptator
    end

    def call(entity:)
      adapted_contract = Alpha::Contracts::Adaptators::AdaptedContract
                         .new(adaptator: @adaptator)
                         .call(contract: @contract)
      entity.from_contract(contract: adapted_contract)
    end
  end
end
