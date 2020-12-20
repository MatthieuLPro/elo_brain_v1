# frozen_string_literal: true

module Regex
  class LastWord
    REGEX = /\w*\S\z/.freeze
    def call(expression:)
      expression.match(REGEX)
    end
  end
end
