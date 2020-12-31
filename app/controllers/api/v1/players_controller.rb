# frozen_string_literal: true

module Api
  module V1
    class PlayersController < ApplicationController
      before_action :authenticate_client

      def index
        render json: { players: PlayersRepo.new.index }
      end

      private

      def authenticate_client
        ApiConstraint.authorize_request(headers: request.headers)
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not authenticated'] }, status: :unauthorized
      end
    end
  end
end
