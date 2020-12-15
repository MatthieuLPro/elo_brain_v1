# frozen_string_literal: true

module Matches
  class Consequences
    def initialize(match:)
      @match = match
    end

    def call(new_elos: Elos::NewElos)
      new_elos.new(winner: winner, looser: looser).call
    end

    private

    def winner
      player = Player.find(@match.winner)
      Players::Player.new(
        nb_matches: player.elos.count,
        current_elo: player.elos.last_level
      )
    end

    def looser
      player = Player.find(@match.looser)
      Players::Player.new(
        nb_matches: player.elos.count,
        current_elo: player.elos.last_level
      )
    end
  end
end
