# frozen_string_literal: true

module Contracts
  class AdaptedContract
    DEFAULT_ADAPTER = DefaultContractAdapter
    def initialize(adapter: nil)
      @adapter = adapter || DEFAULT_ADAPTER
    end

    def call(contract:)
      @adapter.new(contract: contract).adapt
    end
  end
end
