# frozen_string_literal: true

# Need to copy design from matches domain
module Alpha
  module Contracts
    module Adaptators
      class DatesRange < Default
        private

        def data
          @contract.values.data.transform_values(&:to_s)
        end
      end
    end
  end
end
