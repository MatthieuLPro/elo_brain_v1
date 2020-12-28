# frozen_string_literal: true

module AdaptedContracts
  class Match
    DEFAULT = Matches::Contracts::Match.new
    def initialize(contract: DEFAULT)
      @contract = contract
    end

    def call(player1_name:, player1_score:, player2_name:, player2_score:)
      @contract.call(
        player1_name: player1_name,
        player1_score: player1_score,
        player2_name: player2_name,
        player2_score: player2_score
      )
    end
  end
end
