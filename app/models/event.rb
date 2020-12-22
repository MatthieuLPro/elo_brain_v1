# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :matches, dependent: :destroy
end
