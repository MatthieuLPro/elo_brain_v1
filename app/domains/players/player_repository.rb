# frozen_string_literal: true

# TODO: Need to inject here the Match::Player object and create here
# TODO: Remove those functions into repositories file
module Players
  class PlayerRepository
    def player_id(name:)
      (find_player_by_name(name) || create_player(name)).id
    end

    private

    def find_player_by_name(name)
      ::Player.find_by(name: name)
    end

    def create_player(name)
      ::Player.create(name: name)
    end
  end
end
