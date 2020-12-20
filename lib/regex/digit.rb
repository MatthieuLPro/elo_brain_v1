# frozen_string_literal: true

module Regex
  class Digit
    REGEX = /\d/.freeze
    def call(expression:)
      expression.match(REGEX)
    end
  end
end
