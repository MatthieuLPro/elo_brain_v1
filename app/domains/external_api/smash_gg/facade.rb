# frozen_string_literal: true

module ExternalApi
  module SmashGg
    class Facade
      BASE_URL = ENV['SMASH_GG_API_URL']
      TOKEN = ENV['SMASH_GG_TOKEN']

      def initialize(bridge: Bridge.new(base_url: BASE_URL, token: TOKEN))
        @bridge = bridge
      end

      def call(parameter:)
        @bridge.run_now(
          query: parameter.query,
          operation_name: parameter.operation_name,
          variables: parameter.variables
        )
      end
    end
  end
end
