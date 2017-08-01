class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  private

def logged_in?
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :logged_in?

def expired_news?


  @school = School.find(params[:newss_param][:school_id])


  if DateTime.now > @school.expire
        return true 
    else 
        return false 
  end 

 
end  

helper_method :expired_news?

def subscription_expired_news
  
    @y = "your subscription has ended , Please Renew your subscription"
    render json: @y if expired_news?
   
end  

def expired_jobs?


  @school = School.find(params[:job_vacancy][:school_id])


  if DateTime.now > @school.expire
        return true 
    else 
        return false 
  end 

 
end  

helper_method :expired_jobs?

def subscription_expired_jobs
  
    @y = "your subscription has ended , Please Renew your subscription"
    render json: @y if expired_jobs?
   
end  


def authorize
    redirect_to login_path unless logged_in?
end


end
