# frozen_string_literal: true

module Matches
  class Consequences
    def initialize(result:)
      @result = result
    end

    def call(new_elos: Elos::NewElos)
      new_elos.new(
        winner: player(::Player.find(@result.winner_id).elos),
        looser: player(::Player.find(@result.looser_id).elos)
      ).call
    end

    private

    def player(elos)
      Players::Player.with_verification_on(elos)
    end
  end
end
