# frozen_string_literal: true

module Players
  class Repository
    def create(name:)
      player = Player.create(name: name)
      entity(player)
    end

    def find(id:)
      player = Player.find(id)
      entity(player)
    end

    private

    def entities(players)
      players.map { |player| entity(player) }
    end

    def entity(player)
      contract = Players::Contract.new.call(
        id: player.id,
        name: player.name,
        nb_matches: player.nb_matches,
        current_elo: player.last_elo
      )
      Players::Entity.with_contract(contract: contract)
    end
  end
end
