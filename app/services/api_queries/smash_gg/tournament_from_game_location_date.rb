# frozen_string_literal: true

module ApiQueries
  module SmashGg
    class TournamentFromGameLocationDate
      DAY = 86_400
      BEFORE_DATE = (Time.now.to_i - DAY).to_s
      AFTER_DATE = (Time.now.to_i - DAY * 2).to_s
      # BEFORE_DATE = '1608418930'
      # AFTER_DATE = '1608339730'
      EVENTS_PER_PAGE_DEFAULT = 10

      def initialize(coordinates:, radius:, game_id:)
        @coordinates = coordinates
        @radius = radius
        @game_id = game_id
      end

      def call
        query_parameters = create_query_parameters
        ::SmashGg::Queries::TournamentsByGameLocationDate.new.call(params: query_parameters)
      end

      private

      def create_query_parameters
        Entity::CreateEntityWithContract.new(contract: AdaptedContracts::TournamentsParameters.new.call(
          events_per_page: EVENTS_PER_PAGE_DEFAULT,
          area: create_area_entity,
          dates_range: create_dates_range_entity,
          game: create_game_entity
        ))
                                        .call(entity: ::SmashGg::Entities::TournamentsParameters)
      end

      def create_area_entity
        Entity::CreateEntityWithContract.new(contract: AdaptedContracts::Area.new.call(coordinates: @coordinates, radius: @radius))
                                        .call(entity: ::SmashGg::Entities::Area)
      end

      def create_dates_range_entity
        Entity::CreateEntityWithContract.new(contract: AdaptedContracts::DatesRange.new.call(before_date: BEFORE_DATE, after_date: AFTER_DATE))
                                        .call(entity: ::SmashGg::Entities::DatesRange)
      end

      def create_game_entity
        Entity::CreateEntityWithContract.new(contract: AdaptedContracts::Game.new.call(game_id: @game_id))
                                        .call(entity: ::SmashGg::Entities::Game)
      end
    end
  end
end
