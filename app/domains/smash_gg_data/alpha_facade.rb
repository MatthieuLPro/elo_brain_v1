# frozen_string_literal: true

module SmashGgData
  class AlphaFacade
    def initialize(bridge: AlphaBridge.new)
      @bridge = bridge
    end

    def run_alpha_end_point(params:)
      @bridge.run_now(
        query: params[:query],
        operation_name: params[:operation_name],
        variables: params[:variables]
      )
    end
  end
end
