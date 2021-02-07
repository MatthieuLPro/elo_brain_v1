# frozen_string_literal: true

module ExternalApi
  module SmashGg
    class Parameter < Dry::Struct
      attribute :query, Types::Strict::String
      attribute :operation_name, Types::Strict::String.optional
      attribute :variables, Types::JSON::Hash.optional

      def self.from_contract(contract:)
        new(
          query: contract[:query],
          operation_name: contract[:operation_name],
          variables: contract[:variables]
        )
      end
    end
  end
end
