# frozen_string_literal: true

module Regex
  module Collection
    class DisplayScore
      REGEX = /(.+?(?=\s\d\s-\s\S))(\s\d\s-\s)((?<=\s\d -\s).+?(?=\s\d))(\s\d\z)/.freeze
      def call(expression:)
        expression.scan(REGEX).flatten
      end
    end
  end
end
