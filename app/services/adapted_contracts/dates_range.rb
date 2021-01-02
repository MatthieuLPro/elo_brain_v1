# frozen_string_literal: true

module AdaptedContracts
  class DatesRange
    DEFAULT = SmashGg::Contracts::DatesRange.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(before_date:, after_date:)
      @contract.call(
        before_date: before_date,
        after_date: after_date
      )
    end
  end
end
