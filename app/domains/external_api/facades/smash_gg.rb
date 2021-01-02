# frozen_string_literal: true

module ExternalApi
  module Facades
    class SmashGg
      def initialize(bridge: Bridge.new)
        @bridge = bridge
      end

      def run_alpha_end_point(parameter:)
        @bridge.run_now(
          query: parameter.query,
          operation_name: parameter.operation_name,
          variables: parameter.variables
        )
      end
    end
  end
end
