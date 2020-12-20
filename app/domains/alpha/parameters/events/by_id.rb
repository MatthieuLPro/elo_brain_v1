# frozen_string_literal: true

module Alpha
  module Parameters
    module Events
      class ById < Dry::Struct
        attribute :per_page, Types::Strict::Integer
        attribute :id, Types::Strict::Integer
      end
    end
  end
end
