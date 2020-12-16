# frozen_string_literal: true

class Tournament < ApplicationRecord
  belongs_to :ranking
  has_many :matches, dependent: :destroy
end
