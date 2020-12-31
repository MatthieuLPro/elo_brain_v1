# frozen_string_literal: true

class ElosRepo
  def index
    Elo.all
  end

  def index_per_player(player_id:)
    Player.find(player_id).elos
  end

  def index_per_match(match_id:)
    Elo.where(match_id: match_id)
  end

  def create_from(player_id:, level:, match_id:)
    Elo.create(player_id: player_id, level: level, match_id: match_id)
  end
end
