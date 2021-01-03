# frozen_string_literal: true

module Matches
  class MatchExist
    def call(match_information:)
      RunConditions.new(
        Matches::Conditions::DoesNotExist.new(match_information: match_information),
        Matches::Conditions::NotPlayed.new(match_information: match_information)
      ).is_played?
    end
  end
end
