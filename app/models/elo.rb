# frozen_string_literal: true

class Elo < ApplicationRecord
  belongs_to :player
  belongs_to :match

  STARTING_ELO = 1_400
end
