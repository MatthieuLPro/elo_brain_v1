# frozen_string_literal: true

# TODO: Create factory decorator as contracts
module Decorators
  class DecoratorAdapterFactory
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
