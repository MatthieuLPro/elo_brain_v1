# frozen_string_literal: true

module Alpha
  class QueryParameters < Dry::Struct
    attribute :per_page, Types::Strict::String
    attribute :area, Area
    attribute :dates_range, DatesRange
    attribute :game, Game
  end
end
