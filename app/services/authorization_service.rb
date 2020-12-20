# frozen_string_literal: true

class AuthorizationService
  def self.authorize_request(headers:)
    ::Api::Authorization.new(headers: headers).authenticate_request!
  end
end
