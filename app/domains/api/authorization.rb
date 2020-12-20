# frozen_string_literal: true

module Api
  class Authorization
    def initialize(headers: {})
      @headers = headers
    end

    def authenticate_request!
      verify_token
    end

    private

    def http_token
      authorization = @headers['Authorization']
      authorization.split(' ').last if authorization.present?
    end

    def verify_token
      ::Api::JsonWebToken.new.call(token: http_token)
    end
  end
end
