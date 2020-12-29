# frozen_string_literal: true

class AdminConstraint
  def matches?(request)
    return false unless request.session[:user_id]

    User.find(request.session[:user_id])
  end
end
