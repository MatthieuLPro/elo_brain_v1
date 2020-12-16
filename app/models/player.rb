# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :elos, dependent: :destroy
end
