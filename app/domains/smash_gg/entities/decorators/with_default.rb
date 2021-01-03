# frozen_string_literal: true

# TODO: Remove this to decorators adapters
module SmashGg
  module Entities
    module Decorators
      class WithDefault
        def initialize(default:)
          @default = default
        end

        def decorate(value:)
          @default.call(value: value)
        end
      end
    end
  end
end
