class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  private

def logged_in?
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :logged_in?

def expired?


  @school = School.find(params[:api_param][:school_id])

if @school.expire != nil
  if DateTime.now > @school.expire 
        return true 
    else 
        return false 
  end 
else 
    return true 
  end   
 
end  

helper_method :expired?

def subscription_expired
  
    @y = "your subscription has ended , Please Renew your subscription or wait for your school to be approved"
    render json: @y if expired?
   
end  



def authorize
    redirect_to login_path unless logged_in?
end


end
