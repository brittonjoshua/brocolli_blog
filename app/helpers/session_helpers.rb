def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end


# def authorized_user?
#   @entry.user == current_user
# end

def logged_in?
  session[:user_id] != nil
end
