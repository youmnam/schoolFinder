class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 protect_from_forgery with: :exception


  private

def logged_in?
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :logged_in?



def authorize
    redirect_to new_user_path unless logged_in?
end


end
