# frozen_string_literal: true

module Matches
  module ToCalculate
    module Conditions
      class DoesNotExist
        def initialize(match_information:)
          @match_information = match_information
        end

        def played?
          !@match_information.nil?
        end
      end
    end
  end
end
