# frozen_string_literal: true

module Contracts
  class ContractAdapter
    def initialize(contract:)
      @contract = contract
    end

    def adapt
      return error_messages unless no_error?

      data
    end

    private

    def no_error?
      @contract.errors.to_h.empty?
    end

    def error_messages
      @contract.errors.to_h
    end

    def data
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
