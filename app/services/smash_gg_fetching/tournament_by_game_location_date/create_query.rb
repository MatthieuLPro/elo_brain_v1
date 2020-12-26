# frozen_string_literal: true

module SmashGgFetching
  module TournamentByGameLocationDate
    class CreateQuery
      DAY = 86_400
      BEFORE_DATE = (Time.now.to_i - DAY).to_s
      AFTER_DATE = '1606829462'
      PER_PAGE_DEFAULT = '10'

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
        coordinates = Alpha::Dictionaries::WithDictionary
                      .new(dictionary: Alpha::Dictionaries::Coordinates::LIST)
                      .translate(value: @place)
        radius = Alpha::Entities::Decorators::WithDefault
                 .new(default: Alpha::Entities::Decorators::DefaultRadius.new)
                 .decorate(value: @radius)
        SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Area.new.call(coordinates: coordinates, radius: radius))
                                                 .call(entity: Alpha::Entities::Area)
      end

      def create_dates_range_entity
        SmashGgFetching::CreateEntityWithContract
          .new(contract: Alpha::Contracts::DatesRange.new.call(before_date: BEFORE_DATE, after_date: AFTER_DATE))
          .call(entity: Alpha::Entities::DatesRange)
      end

      def create_game_entity
        game_id = Alpha::Dictionaries::WithDictionary
                  .new(dictionary: Alpha::Dictionaries::Games::LIST)
                  .translate(value: @game)
        SmashGgFetching::CreateEntityWithContract.new(contract: Alpha::Contracts::Game.new.call(game_id: game_id))
                                                 .call(entity: Alpha::Entities::Game)
      end

      def create_query_parameters(area, dates_range, game)
        Alpha::Parameters::Tournaments::ByGameLocationDate.new(
          per_page: PER_PAGE_DEFAULT,
          coordinates: area.coordinates,
          radius: area.radius,
          before_date: dates_range.before_date,
          after_date: dates_range.after_date,
          game_id: game.game_id
        )
      end
    end
  end
end
