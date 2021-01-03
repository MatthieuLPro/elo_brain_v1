# frozen_string_literal: true

module Players
  class CreateInformation
    ENTITY = Players::Entities::Information
    CONTRACT = Players::Contracts::Information
    ELOS_REPOSITORY = ElosRepo.new
    MATCHES_REPOSITORY = MatchesRepo.new
    def initialize(player_id:)
      @player_id = player_id
    end

    def call
      Entity::CreateEntityWithContract.new(contract: information_contract).call(entity: ENTITY)
    end

    private

    def information_contract
      CONTRACT.new.call(
        id: @player_id,
        nb_matches: nb_matches(elos_collection_data),
        current_elo: current_player_elo(elos_collection_data)
      )
    end

    def elos_collection_data
      ELOS_REPOSITORY.index_per_player(player_id: @player_id)
    end

    def nb_matches(elos_collection)
      MATCHES_REPOSITORY.nb_matches_by(elos_collection: elos_collection)
    end

    def current_player_elo(elos_collection)
      Players::Entities::Decorators::WithDefault
        .new(default: Players::Entities::Decorators::DefaultElo.new)
        .decorate(value: elos_collection)
    end
  end
end
