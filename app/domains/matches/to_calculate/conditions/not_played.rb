# frozen_string_literal: true

# TODO: Very specific to SmashGg API
module Matches
  module ToCalculate
    module Conditions
      class NotPlayed
        EMPTY_MATCH = 'DQ'
        def initialize(match_information:)
          @match_information = match_information
        end

        def played?
          @match_information != EMPTY_MATCH
        end
      end
    end
  end
end
