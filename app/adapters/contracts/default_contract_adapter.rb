# frozen_string_literal: true

module Contracts
  class DefaultContractAdapter < ContractAdapter
    def data
      @contract.values.data
    end
  end
end
