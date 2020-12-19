# frozen_string_literal: true

module Alpha
  class DatesRange < Dry::Struct
    attribute :before_date, Types::Strict::String.constrained(format: /\d{10}/)
    attribute :after_date, Types::Strict::String.constrained(format: /\d{10}/)

    def self.with_timestamp(before_date:, after_date:)
      new(
        before_date: before_date,
        after_date: after_date
      )
    end
  end
end
