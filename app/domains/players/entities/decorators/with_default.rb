# frozen_string_literal: true

module Players
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
