# frozen_string_literal: true

module Alpha
  module Entities
    class EventParameters < Dry::Struct
      attribute :per_page, Types::Strict::Integer
      attribute :id, Types.Instance(Alpha::Entities::Id)

      def self.from_contract(contract:)
        new(
          per_page: contract[:events_per_page],
          id: contract[:event_id]
        )
      end
    end
  end
end
