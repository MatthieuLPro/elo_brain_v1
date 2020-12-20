# frozen_string_literal: true

module Alpha
  module Contracts
    class AdaptedContract
      def call(contract:, adaptator:)
        adaptator.new(contract: contract).adapt
      end
    end
  end
end
