# frozen_string_literal: true

module SmashGgData
  class AlphaParameter < Dry::Struct
    attribute :query, Types::Strict::String
    attribute :operation_name, Types::Strict::String.optional
    attribute :variables, Types::JSON::Hash.optional
  end
end
