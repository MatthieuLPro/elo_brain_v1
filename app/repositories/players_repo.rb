# frozen_string_literal: true

class PlayersRepo
  def index
    Player.all
  end

  def create_with(name:)
    Player.create(name: name)
  end

  def find_by(name:)
    Player.find_by(name: name)
  end
end
