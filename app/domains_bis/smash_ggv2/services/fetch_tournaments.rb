# frozen_string_literal: true

module SmashGgv2
  module Services
    class FetchTournaments
      API = ApiCall::SmashGg.new

      def call(area: nil, dates_range: nil, game: nil)
        # TODO: Replace hardcoded numbers by args
        area = ::SmashGgv2::Areas::Entity.new(coordinates: '48.8534,2.3488', radius: '31mi')
        dates_range = ::SmashGgv2::DatesRanges::Entity.new(before_date: '1548979200', after_date: '1546300800')
        game = ::SmashGgv2::Games::Entity.new(id: '1386')
        query = ::SmashGgv2::ApiQueries::TournamentsByGameLocationDate.new.call(area: area, dates_range: dates_range, game: game)
        ::Tournamentsv2::TournamentsRepository.new.from_smash_gg(query: query)
      end
    end
  end
end
