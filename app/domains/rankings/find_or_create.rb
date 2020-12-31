# frozen_string_literal: true

# TODO: We should create ranking manually
module Rankings
  class FindOrCreate
    REPOSITORY = RankingsRepo.new

    def initialize(game:, event_date:)
      @game = game
      @event_date = event_date
    end

    def call
      find_ranking || create_ranking
    end

    private

    def create_ranking
      REPOSITORY.create_by(
        game: @game,
        start_date: @event_date.beginning_of_year,
        end_date: @event_date.end_of_year
      )
    end

    def find_ranking
      REPOSITORY.find_by(
        game: @game,
        start_date: @event_date.beginning_of_year,
        end_date: @event_date.end_of_year
      )
    end
  end
end
