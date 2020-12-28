# frozen_string_literal: true

module AdaptedContracts
  class Game
    DEFAULT = Alpha::Contracts::Game.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(game_id:)
      @contract.call(
        game_id: game_id
      )
    end
  end
end
