# frozen_string_literal: true

class Ranking < ApplicationRecord
  belongs_to :game
  has_many :events, dependent: :destroy
end
