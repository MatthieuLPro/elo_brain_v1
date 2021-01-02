# frozen_string_literal: true

# TODO: Events per page but we search with a unique id of an event ?
module Alpha
  module Contracts
    class TournamentsParameters < Dry::Validation::Contract
      params do
        required(:events_per_page).filled(:integer)
        required(:area).filled(Types::AreaEntity)
        required(:dates_range).filled(Types::DatesRangeEntity)
        required(:game).filled(Types::GameEntity)
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
