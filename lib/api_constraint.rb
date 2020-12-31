# frozen_string_literal: true

class ApiConstraint
  def self.authorize_request(headers:)
    ::Api::Authorization.new(headers: headers).authenticate_request!
  end
end
