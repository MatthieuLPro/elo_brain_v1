# frozen_string_literal: true

module Players
  class Player < Dry::Struct
    attribute :nb_matches, Types::Strict::Integer
    attribute :current_elo, Types::Strict::Integer
  end
end
