# frozen_string_literal: true

module AdaptedContracts
  class TournamentsParameters
    DEFAULT = Alpha::Contracts::TournamentsParameters.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(events_per_page:, area:, dates_range:, game:)
      @contract.call(
        events_per_page: events_per_page,
        area: area,
        dates_range: dates_range,
        game: game
      )
    end
  end
end
