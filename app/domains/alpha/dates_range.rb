# frozen_string_literal: true

module Alpha
  class DatesRange < Dry::Struct
    attribute :before_date, Types::Strict::String.constrained(format: /\d{10}/)
    attribute :after_date, Types::Strict::String.constrained(format: /\d{10}/)

    def self.from_contract_data(contract)
      new(
        before_date: contract[:before_date],
        after_date: contract[:after_date]
      )
    end
  end
end
