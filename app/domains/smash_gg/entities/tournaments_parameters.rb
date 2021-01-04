# frozen_string_literal: true

module SmashGg
  module Entities
    class TournamentsParameters < Dry::Struct
      attribute :per_page, Types::Strict::Integer
      attribute :area, Types.Instance(SmashGg::Entities::Area)
      attribute :dates_range, Types.Instance(SmashGg::Entities::DatesRange)
      attribute :game, Types.Instance(SmashGg::Entities::Game)

      def self.from_contract(contract:)
        new(
          per_page: contract[:events_per_page],
          area: contract[:area],
          dates_range: contract[:dates_range],
          game: contract[:game]
        )
      end
    end
  end
end