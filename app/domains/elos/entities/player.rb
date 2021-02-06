# frozen_string_literal: true

module Elos
  module Entities
    class Player < Dry::Struct
      attribute :information, Types.Instance(::Players::Entities::Information)

      def self.from_contract(contract:)
        new(
          information: contract[:information]
        )
      end
    end
  end
end
