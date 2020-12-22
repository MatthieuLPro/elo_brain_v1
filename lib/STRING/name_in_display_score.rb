# frozen_string_literal: true

module STRING
  class NameInDisplayScore
    def call(expression:)
      expression.split('|').last.strip
    end
  end
end
