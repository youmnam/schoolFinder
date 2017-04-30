class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
include ActionController::Serialization
  helper_method :current_user 

  def current_user 
    
  	 @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  
  helper_method :current_renter 
  def current_renter 
  	 @current_renter ||= Renter.find(session[:renter_id]) if session[:renter_id] 
  end

  def require_user 
  			redirect_to '/login' unless current_user 
  end
  
  def require_renter 
  			redirect_to '/loginrenter' unless current_renter 
  end
  
  
  protect_from_forgery with: :exception
end
