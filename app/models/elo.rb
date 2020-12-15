# frozen_string_literal: true

class Elo < ApplicationRecord
  belongs_to :player
  belongs_to :match

  scope :last_level, -> { max.level }
end
