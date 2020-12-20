# frozen_string_literal: true

module Api
  module V1
    # All the methods are for the moment secured
    # Maybe it should be better to remove the securedController
    # and to create a private method which do the job for
    # specific methods inside the playersController
    class PlayersController < SecuredController
      def index
        render json: { players: Player.all }
      end

      def show
        render json: { test: 'john' }
      end
    end
  end
end
