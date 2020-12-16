# frozen_string_literal: true

module Matches
  class Consequences
    def initialize(match:)
      @match = match
    end

    def call(new_elos: Elos::NewElos)
      new_elos.new(
        winner: player(Player.find(@match.winner.id).elos),
        looser: player(Player.find(@match.looser.id).elos)
      ).call
    end

    private

    def player(elos)
      Players::Player.with_verification_on(elos)
    end
  end
end
