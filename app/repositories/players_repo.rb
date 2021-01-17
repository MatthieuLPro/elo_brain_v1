# frozen_string_literal: true

class PlayersRepo
  ENTITY_BUILDER = Entity::CreateEntityWithAr.new(entity: ::Players::Entities::Player)
  def index
    players = Player.all
    ENTITY_BUILDER.entities(players)
  end

  def create_with(name:)
    player = Player.create(name: name)
    ENTITY_BUILDER.entity(player)
  end

  def find_by(name:)
    player = Player.find_by(name: name)
    return unless player

    ENTITY_BUILDER.entity(player)
  end
end
