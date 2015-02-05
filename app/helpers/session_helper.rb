helpers do
  def session_logged_in?
    !session_current_user.nil?
  end

  def session_current_user_id
    session[:current_user_id]
  end

  def session_set_current_user
    return nil if session_current_user_id.blank?
    begin
      @current ||= User.find(session_current_user_id)
    rescue
      session_logout
    end
  end

  def session_logout_and_redirect
    session_logout
    redirect '/'
  end

  def session_authenticate email, password
    candidate = User.find_by(:email => email)

  end