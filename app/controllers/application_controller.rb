class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def hello
    render html: "Hello,world!"
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :name)}

    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:user_id, :password, :remember_me)}
  end

end
