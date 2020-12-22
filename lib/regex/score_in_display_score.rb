# frozen_string_literal: true

module Regex
  class ScoreInDisplayScore
    REGEX = /\d/.freeze
    def call(expression:)
      expression.match(REGEX)[0].to_i
    end
  end
end
