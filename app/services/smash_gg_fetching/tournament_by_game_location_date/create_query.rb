# frozen_string_literal: true

module SmashGgFetching
  module TournamentByGameLocationDate
    class CreateQuery
      DAY = 86_400
      AFTER_DATE = 1_606_829_462
      PER_PAGE = '10'

      def initialize(place:, radius:, game:)
        @place = place
        @radius = radius
        @game = game
      end

      def call
        query_parameters = create_query_parameters(
          create_area_entity,
          create_dates_range_entity,
          create_game_entity
        )
        Alpha::Queries::Tournaments::ByGameLocationDate.new.call(params: query_parameters)
      end

      private

      def create_area_entity
        SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Area.new.call(place: @place, radius: @radius))
                                                 .call(entity: Alpha::Entities::Area)
      end

      def create_dates_range_entity
        SmashGgFetching::CreateEntityWithContract.new(
          contract: Alpha::Contracts::DatesRange.new.call(before_date: Time.now.to_i - DAY, after_date: AFTER_DATE),
          adaptator: Alpha::Contracts::Adaptators::DatesRange
        ).call(entity: Alpha::Entities::DatesRange)
      end

      def create_game_entity
        SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Game.new.call(name: @game))
                                                 .call(entity: Alpha::Entities::Game)
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
