# frozen_string_literal: true

module AdaptedContracts
  class PlayerResult
    DEFAULT = Matches::Contracts::PlayerResult.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(id:, score:)
      @contract.call(id: id, score: score)
    end
  end
end
