# frozen_string_literal: true

class PlayersRepo
  def index
    Player.all
  end
end
