# frozen_string_literal: true

module Alpha
  class Parameter < Dry::Struct
    attribute :query, Types::Strict::String
    attribute :operation_name, Types::String.optional
    attribute :variables, Types::JSON::Hash.optional
  end
end
