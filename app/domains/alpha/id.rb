# frozen_string_literal: true

module Alpha
  class Id < Dry::Struct
    attribute :number, Types::Strict::Integer

    def self.from_contract_data(contract)
      new(
        number: contract[:number]
      )
    end
  end
end
