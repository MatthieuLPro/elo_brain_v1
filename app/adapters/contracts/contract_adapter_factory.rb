# frozen_string_literal: true

module Contracts
  class ContractAdapterFactory
    ADAPTER_IDENTIFIER = {
      default: DefaultContractAdapter
    }.freeze

    def from_identifier(identifier:)
      klass = ADAPTER_IDENTIFIER[identifier.to_sym]

      raise UnknownAdapterError, identifier if klass.blank?

      klass.new
    end
  end
end
