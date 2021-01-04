# frozen_string_literal: true

module SmashGg
  class CreateRadius
    def call(radius:)
      ::SmashGg::Entities::Decorators::WithDefault
        .new(default: ::SmashGg::Entities::Decorators::DefaultRadius.new)
        .decorate(value: radius)
    end
  end
end
