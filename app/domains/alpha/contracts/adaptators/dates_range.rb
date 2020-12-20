# frozen_string_literal: true

module Alpha
  module Contracts
    module Adaptators
      # Should probably find a better design pattern
      class DatesRange < Standard
        private

        def data
          @contract.values.data.transform_values(&:to_s)
        end
      end
    end
  end
end
