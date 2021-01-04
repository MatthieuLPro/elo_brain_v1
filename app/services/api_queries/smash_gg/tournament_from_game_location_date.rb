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

      def call(place:, radius:, game:)
        query_parameters = create_query_parameters(
          create_area_entity(place, radius),
          create_dates_range_entity,
          create_game_entity(game)
        )
        ::SmashGg::Queries::TournamentsByGameLocationDate.new.call(params: query_parameters)
      end

      private

      def create_area_entity(place, radius)
        area_adapted_contract = AdaptedContracts::Creator.new.call(contract: AdaptedContracts::Area.new.call(
          coordinates: ::SmashGg::CreateCoordinates.new.call(place: place),
          radius: ::SmashGg::CreateRadius.new.call(radius: radius)
        ))
        Entity::EntityCreator.new(entity: ::SmashGg::Entities::Area).call(adapted_contract: area_adapted_contract)
      end

      def create_dates_range_entity
        dates_range_adapted_contract = AdaptedContracts::Creator.new.call(contract: AdaptedContracts::DatesRange.new.call(before_date: BEFORE_DATE, after_date: AFTER_DATE))
        Entity::EntityCreator.new(entity: ::SmashGg::Entities::DatesRange).call(adapted_contract: dates_range_adapted_contract)
      end

      def create_game_entity(game)
        game_adapted_contract = AdaptedContracts::Creator.new.call(contract: AdaptedContracts::Game.new.call(
          game_id: ::SmashGg::CreateGame.new.call(game: game)
        ))
        Entity::EntityCreator.new(entity: ::SmashGg::Entities::Game).call(adapted_contract: game_adapted_contract)
      end

      def create_query_parameters(area, dates_range, game)
        game_adapted_contract = AdaptedContracts::Creator.new.call(contract: AdaptedContracts::TournamentsParameters.new.call(
          events_per_page: EVENTS_PER_PAGE_DEFAULT,
          area: area,
          dates_range: dates_range,
          game: game
        ))
        Entity::EntityCreator.new(entity: ::SmashGg::Entities::TournamentsParameters).call(adapted_contract: game_adapted_contract)
      end
    end
  end
end
