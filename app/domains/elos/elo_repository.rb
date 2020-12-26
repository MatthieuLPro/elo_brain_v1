# frozen_string_literal: true

module Elos
  class EloRepository
    def create(player_id:, level:, match_id:)
      ::Elo.create(player_id: player_id, level: level, match_id: match_id)
    end

    def elos_by_player(player_id:)
      ::Player.find(player_id).elos
    end
  end
end
