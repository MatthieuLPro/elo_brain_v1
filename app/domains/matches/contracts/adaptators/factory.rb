# frozen_string_literal: true

module Matches
  module Contracts
    module Adaptators
      class Factory
        ADAPTATOR_IDENTIFIER = {
          default: Default
        }.freeze

        def from_identifier(identifier:)
          klass = ADAPTATOR_IDENTIFIER[identifier.to_sym]

          raise UnknownAdaptatorError, identifier if klass.blank?

          klass.new
        end
      end
    end
  end
end
