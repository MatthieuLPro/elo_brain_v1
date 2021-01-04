# frozen_string_literal: true

module Matches
  class PlayerRole
    def initialize(player1:, player2:)
      @player1 = player1
      @player2 = player2
    end

    def winner_id
      return @player1.id if player1_beat_player2

      @player2.id
    end

    def looser_id
      return @player1.id unless player1_beat_player2

      @player2.id
    end

    private

    def player1_beat_player2
      @player1.score > @player2.score
    end
  end
end
