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

  def create_from(event_id:, winner_id:, looser_id:, completed_at:)
    Match.create(event_id: event_id, winner_id: winner_id, looser_id: looser_id, completed_at: completed_at)
  end

  def nb_matches_by(elos_collection:)
    elos_collection.count
  end
end
