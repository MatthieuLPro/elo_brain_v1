# frozen_string_literal: true

module Matches
  module ToCalculate
    class MatchExist
      def call(match_information:)
        RunConditions.new(
          Matches::ToCalculate::Conditions::DoesNotExist.new(match_information: match_information),
          Matches::ToCalculate::Conditions::NotPlayed.new(match_information: match_information)
        ).played?
      end
    end
  end
end
