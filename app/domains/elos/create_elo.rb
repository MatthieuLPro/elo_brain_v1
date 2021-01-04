# frozen_string_literal: true

module Elos
  class CreateElo
    DEFAULT_REPO = ElosRepo.new
    def initialize(elos_repo: DEFAULT_REPO)
      @elos_repo = elos_repo
    end

    def call(player_id:, level:, match_id:)
      @elos_repo.create_from(player_id: player_id, level: level, match_id: match_id)
    end
  end
end
