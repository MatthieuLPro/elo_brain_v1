# frozen_string_literal: true

# TODO: Events per page but we search with a unique id of an event ?
module SmashGg
  module Contracts
    class EventParameters < Dry::Validation::Contract
      params do
        required(:events_per_page).filled(:integer)
        required(:event_id).filled(Types::IdEntity)
      end

      rule(:events_per_page) do
        key.failure('must be positive') unless value.positive?
      end

      rule(:events_per_page) do
        key.failure('must be below 100') unless value < 100
      end
    end
  end
end
