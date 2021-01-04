# frozen_string_literal: true

module Matches
  class Results
    DEFAULT_NEW_ELOS = Elos::NewElos

    def initialize(new_elos: DEFAULT_NEW_ELOS)
      @new_elos = new_elos
    end

    def call(result:)
      @new_elos.new(
        winner_information: Players::CreateInformation.new(player_id: result.winner_id).call,
        looser_information: Players::CreateInformation.new(player_id: result.looser_id).call
      ).call
    end
  end
end
