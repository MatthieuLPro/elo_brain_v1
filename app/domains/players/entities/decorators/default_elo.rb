# frozen_string_literal: true

module Players
  module Entities
    module Decorators
      class DefaultElo
        DEFAULT_VALUE = ::Elo::STARTING_ELO

        def initialize(starting_elo: DEFAULT_VALUE)
          @starting_elo = starting_elo
        end

        def call(value:)
          return @starting_elo if value.nil?

          value.level
        end
      end
    end
  end
end
