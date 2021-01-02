# frozen_string_literal: true

module AdaptedContracts
  class Area
    DEFAULT = SmashGg::Contracts::Area.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(coordinates:, radius:)
      @contract.call(
        coordinates: coordinates,
        radius: radius
      )
    end
  end
end
