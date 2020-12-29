# frozen_string_literal: true

class AdminAuthentification
  def call(user_id:)
    return unless user_id

    User.find(user_id)
  end
end
