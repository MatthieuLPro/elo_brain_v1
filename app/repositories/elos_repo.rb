# frozen_string_literal: true

class ElosRepo
  def index
    Elo.all
  end

  def index_per_player(player_id:)
    Elo.where(player_id: player_id)
  end

  def index_per_match(match_id:)
    Elo.where(match_id: match_id)
  end
end
