module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user = User.find_by(id: user_id)
    end
  end

  def correct_user(user)
    user == current_user
  end

  def is_admin?
    if(!current_user.nil?)
      current_user.is_admin
    else
      return false
    end
  end
end
