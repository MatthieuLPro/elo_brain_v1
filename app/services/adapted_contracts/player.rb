# frozen_string_literal: true

module AdaptedContracts
  class Player
    DEFAULT = Matches::Contracts::Player.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(id:, name:, score:)
      @contract.call(id: id, name: name, score: score)
    end
  end
end
