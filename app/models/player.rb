# frozen_string_literal: true

class Player < ApplicationRecord
  after_create :create_first_elo

  has_many :elos, dependent: :destroy

  def create_first_elo
    elos.create(match: Match.first)
  end
end
