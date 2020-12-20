# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :ranking
  has_many :matches, dependent: :destroy
end
