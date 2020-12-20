# frozen_string_literal: true

module Alpha
  module Parameters
    module Tournaments
      class ByGameLocationDate < Dry::Struct
        attribute :per_page, Types::Strict::String
        attribute :coordinates, Types::Strict::String
        attribute :radius, Types::Strict::String
        attribute :before_date, Types::Strict::String
        attribute :after_date, Types::Strict::String
        attribute :video_game_id, Types::Strict::String
      end
    end
  end
end
