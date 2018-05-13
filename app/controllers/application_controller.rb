class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
 #회원가입시 해당 정보를 추가적으로 받기 위한코드 
   before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
 def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:club_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:club_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:author])
    devise_parameter_sanitizer.permit(:account_update, keys: [:author])
  end
 
 
end
