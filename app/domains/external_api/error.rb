# frozen_string_literal: true

module ExternalApi
  class Error < StandardError
    def initialize(msg = nil)
      super
    end
  end
end
