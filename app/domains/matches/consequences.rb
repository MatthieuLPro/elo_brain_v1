# frozen_string_literal: true

module Matches
  class Consequences
    REPOSITORY = ElosRepo.new
    def initialize(result:)
      @result = result
    end

    def call(new_elos: Elos::NewElos)
      new_elos.new(
        winner: player_information(elos_by_player(@result.winner_id)),
        looser: player_information(elos_by_player(@result.looser_id))
      ).call
    end

    private

    def elos_by_player(id)
      REPOSITORY.index_per_player(player_id: id)
    end

    def player_information(elos_collection)
      adapted_contract = ::Contracts::AdaptedContract.new.call(contract:
                                            Players::Contracts::PlayerInformation.new.call(
                                              nb_matches: nb_matches(elos_collection),
                                              current_elo: current_player_elo(elos_collection)
                                            ))
      Players::Entities::PlayerInformation.from_contract(contract: adapted_contract)
    end

    def nb_matches(elos_collection)
      MatchesRepo.new.nb_matches_by(elos_collection: elos_collection)
    end

    def current_player_elo(elos_collection)
      Players::Entities::Decorators::WithDefault
        .new(default: Players::Entities::Decorators::DefaultElo.new)
        .decorate(value: elos_collection)
    end
  end
end
