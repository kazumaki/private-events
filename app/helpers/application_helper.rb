module ApplicationHelper
  def current_user
    if session[:user_id]
      return User.find_by(id: session[:user_id])
    end
    nil
  end

  def logged_in?
    !current_user.nil?
  end
end
