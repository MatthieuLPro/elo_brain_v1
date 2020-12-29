# frozen_string_literal: true

class MatchesRepo
  def index
    Match.all
  end

  def index_per_event(event_id:)
    Match.where(event_id: event_id)
  end

  def index_per_player(player_id:)
    Match.where(winner_id: player_id).or(Match.where(looser_id: player_id))
  end
end
