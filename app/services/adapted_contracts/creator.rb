# frozen_string_literal: true

module AdaptedContracts
  class Creator
    DEFAULT = ::Contracts::AdaptedContract.new
    def initialize(adapted_contract: DEFAULT)
      @adapted_contract = adapted_contract
    end

    def call(contract:)
      @adapted_contract.call(contract: contract)
    end
  end
end
