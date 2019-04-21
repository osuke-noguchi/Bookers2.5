class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

 # before_action :authenticate_user!






  # def authenticate_user
  #   if @current_user == nil
  #     flash[:notice]= "ログインが必要です"
  #     redirect_to root_path
  #   end
  # end
  protected
  # before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end

  def after_sign_in_path_for(resource)
      user_path(resource)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
