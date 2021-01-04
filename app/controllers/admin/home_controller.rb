# frozen_string_literal: true

module Admin
  class HomeController < ApplicationController
    before_action :authenticate_user

    def home; end

    def rankings
      @ranking = ::RankingsRepo.new.index
    end

    def events
      @events = ::EventsRepo.new.index
    end

    def players
      @players = ::PlayersRepo.new.index
    end

    def matches
      @matches = ::MatchesRepo.new.index
    end

    private

    def authenticate_user
      redirect_to new_session_path unless AdminConstraint.new.matches?(request)
    end
  end
end
