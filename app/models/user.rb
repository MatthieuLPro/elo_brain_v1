# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
end
