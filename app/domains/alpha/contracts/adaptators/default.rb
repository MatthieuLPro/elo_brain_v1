# frozen_string_literal: true

# Need to copy design from matches domain
module Alpha
  module Contracts
    module Adaptators
      class Default
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
          @contract.values.data
        end
      end
    end
  end
end
