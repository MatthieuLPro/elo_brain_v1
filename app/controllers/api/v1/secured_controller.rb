# frozen_string_literal: true

module Api
  module V1
    # Maybe it should be better to remove the securedController
    # and to create a private method which do the job for
    # specific methods inside each controller
    class SecuredController < ApplicationController
      before_action :authorize_request

      private

      def authorize_request
        AuthorizationService.authorize_request(headers: request.headers)
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not authenticated'] }, status: :unauthorized
      end
    end
  end
end
