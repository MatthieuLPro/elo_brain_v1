# frozen_string_literal: true

module Matches
  module Conditions
    class DoesNotExist
      def initialize(match_information:)
        @match_information = match_information
      end

      def is_played?
        !@match_information.nil?
      end
    end
  end
end
