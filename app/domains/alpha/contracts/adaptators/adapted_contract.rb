# frozen_string_literal: true

module Alpha
  module Contracts
    module Adaptators
      class AdaptedContract
        DEFAULT_ADAPTATOR = Default
        def initialize(adaptator: nil)
          @adaptator = adaptator || DEFAULT_ADAPTATOR
        end

        def call(contract:)
          @adaptator.new(contract: contract).adapt
        end
      end
    end
  end
end
