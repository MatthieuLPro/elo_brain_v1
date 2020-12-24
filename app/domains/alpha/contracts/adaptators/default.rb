# frozen_string_literal: true

module Alpha
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
