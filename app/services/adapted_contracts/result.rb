# frozen_string_literal: true

module AdaptedContracts
  class Result
    DEFAULT = Matches::Contracts::Result.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(winner_id:, looser_id:)
      @contract.call(
        winner_id: winner_id,
        looser_id: looser_id
      )
    end
  end
end
