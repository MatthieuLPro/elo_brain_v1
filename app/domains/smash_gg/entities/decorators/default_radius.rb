# frozen_string_literal: true

# TODO: Remove this to decorators adapters
module SmashGg
  module Entities
    module Decorators
      class DefaultRadius
        DEFAULT_VALUE = '31mi'

        def call(value:)
          return DEFAULT_VALUE if value.nil? || value.empty?

          value
        end
      end
    end
  end
end
