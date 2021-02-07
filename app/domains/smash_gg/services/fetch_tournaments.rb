# frozen_string_literal: true

module SmashGg
  module Services
    class FetchTournaments
      API = ApiCall::SmashGg.new

      def call(area: nil, dates_range: nil, game: nil)
        # TODO: Replace hardcoded numbers by args
        area = ::SmashGg::Areas::Entity.new(coordinates: '48.8534,2.3488', radius: '31mi')
        dates_range = ::SmashGg::DatesRanges::Entity.new(before_date: '1548979200', after_date: '1546300800')
        game = ::SmashGg::Games::Entity.new(id: '1386')
        query = ::SmashGg::ApiQueries::TournamentsByGameLocationDate.new.call(area: area, dates_range: dates_range,
                                                                              game: game)
        ::Tournaments::TournamentsRepository.new.from_smash_gg(query: query)
      end
    end
  end
end
