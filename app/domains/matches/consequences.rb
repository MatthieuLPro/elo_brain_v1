# frozen_string_literal: true

module Matches
  class Consequences
    REPOSITORY = ElosRepo.new
    NEW_ELOS = Elos::NewElos
    def initialize(result:)
      @result = result
    end

    def call(new_elos: NEW_ELOS)
      new_elos.new(
        winner_information: Players::CreateInformation.new(player_id: @result.winner_id).call,
        looser_information: Players::CreateInformation.new(player_id: @result.looser_id).call
      ).call
    end
  end
end
