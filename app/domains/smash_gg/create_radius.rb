# frozen_string_literal: true

module SmashGg
  class CreateRadius
    SMASHGG_DECORATOR = ::SmashGg::Entities::Decorators::DefaultRadius.new
    def initialize(decorator: SMASHGG_DECORATOR)
      @decorator = decorator
    end

    def call(radius:)
      ::SmashGg::Entities::Decorators::WithDefault
        .new(default: SMASHGG_DECORATOR)
        .decorate(value: radius)
    end
  end
end
