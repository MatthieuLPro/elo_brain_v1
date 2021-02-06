# frozen_string_literal: true

module Elos
  module Contracts
    module Types
      include Dry::Types()

      PlayerEntity = Types.Instance(::Players::Entities::Information)
    end
  end
end
