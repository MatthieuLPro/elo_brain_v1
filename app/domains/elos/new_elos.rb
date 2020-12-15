# frozen_string_literal: true

module Elos
  class NewElos
    def initialize(winner:, looser:)
      @winner = winner
      @looser = looser
    end

    def call
      {
        winner: winner_elo.call(winner: @winner, looser: @looser),
        looser: looser_elo.call(winner: @winner, looser: @looser)
      }
    end

    private

    def winner_elo
      ::Elos::Calculator::Factory.new.from_identifier(identifier: 'winner')
    end

    def looser_elo
      ::Elos::Calculator::Factory.new.from_identifier(identifier: 'looser')
    end
  end
end
