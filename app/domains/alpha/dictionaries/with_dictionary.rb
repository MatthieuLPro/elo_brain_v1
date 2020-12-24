# frozen_string_literal: true

module Alpha
  module Dictionaries
    class WithDictionary
      def initialize(dictionary:)
        @dictionary = dictionary
      end

      def translate(value:)
        @dictionary[value.to_sym]
      end
    end
  end
end
