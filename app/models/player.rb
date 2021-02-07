# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :elos, dependent: :destroy
  has_many :matches, dependent: :destroy

  def nb_matches
    elos.count
  end

  def last_elo
    elos.last.value || Elo::STARTING_ELO
  end
end
