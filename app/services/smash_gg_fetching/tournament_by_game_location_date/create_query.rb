# frozen_string_literal: true

module SmashGgFetching
  module TournamentByGameLocationDate
    class CreateQuery
      AFTER_DATE = 1_606_829_462
      PER_PAGE = '10'

      def initialize(place:, radius:, game:)
        @place = place
        @radius = radius
        @game = game
      end

      def call
        query_parameters = create_query_parameters(
          create_area_object,
          create_dates_range_object,
          create_game_object
        )
        Alpha::Queries::Tournaments::ByGameLocationDate.new.call(params: query_parameters)
      end

      private

      def create_area_object
        adapted_contract = Alpha::Contracts::AdaptedContract.new.call(
          contract: Alpha::Contracts::Area.new.call(place: @place, radius: @radius),
          adaptator: Alpha::Contracts::Adaptators::Standard
        )
        Alpha::Area.from_contract_data(adapted_contract)
      end

      def create_dates_range_object
        adapted_contract = Alpha::Contracts::AdaptedContract.new.call(
          contract: Alpha::Contracts::DatesRange.new.call(before_date: Time.now.to_i, after_date: AFTER_DATE),
          adaptator: Alpha::Contracts::Adaptators::DatesRange
        )
        Alpha::DatesRange.from_contract_data(adapted_contract)
      end

      def create_game_object
        adapted_contract = Alpha::Contracts::AdaptedContract.new.call(
          contract: Alpha::Contracts::Game.new.call(name: @game),
          adaptator: Alpha::Contracts::Adaptators::Standard
        )
        Alpha::Game.from_contract_data(adapted_contract)
      end

      def create_query_parameters(area, dates_range, game)
        Alpha::Parameters::Tournaments::ByGameLocationDate.new(
          per_page: PER_PAGE,
          coordinates: area.coordinates,
          radius: area.radius,
          before_date: dates_range.before_date,
          after_date: dates_range.after_date,
          video_game_id: game.video_game_id
        )
      end
    end
  end
end
