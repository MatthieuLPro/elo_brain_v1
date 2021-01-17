# frozen_string_literal: true

class ElosRepo
  ENTITY_BUILDER = Entity::CreateEntityWithAr.new(entity: ::Elos::Entities::Elo)
  def index_per_player(player_id:)
    elos = Player.find(player_id).elos
    ENTITY_BUILDER.entities(elos)
  end

  def player_last_elo(player_id:)
    elo = Player.find(player_id).elos.last
    return unless elo

    ENTITY_BUILDER.entity(elo)
  end

  def create_from(player_id:, level:, match_id:)
    elo = Elo.create(player_id: player_id, level: level, match_id: match_id)
    ENTITY_BUILDER.entity(elo)
  end
end
