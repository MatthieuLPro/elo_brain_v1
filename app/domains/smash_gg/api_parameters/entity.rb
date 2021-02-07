# frozen_string_literal: true

module SmashGg
  module ApiParameters
    class Entity < Dry::Struct
      attribute :query, Types::Strict::String
      attribute :operation_name, Types::Strict::String.optional
      attribute :variables, Types::JSON::Hash.optional
    end
  end
end
