# frozen_string_literal: true

module Matches
  module Contracts
    module Adaptators
      class Default < Adaptator
        def data
          @contract.values.data
        end
      end
    end
  end
end
