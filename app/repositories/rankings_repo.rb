# frozen_string_literal: true

class RankingsRepo
  def index
    Ranking.all
  end

  def create_by(game:, start_date:, end_date:)
    Ranking.create(game: game, start_date: start_date, end_date: end_date)
  end

  def find_by(game:, start_date:, end_date:)
    Ranking.find_by(game: game, start_date: start_date, end_date: end_date)
  end
end
