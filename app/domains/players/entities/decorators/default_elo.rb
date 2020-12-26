# frozen_string_literal: true

module Players
  module Entities
    module Decorators
      class DefaultElo
        DEFAULT_VALUE = ::Elo::STARTING_ELO

        def call(value:)
          return DEFAULT_VALUE if value.count.zero?

          value.last_level
        end
      end
    end
  end
end
