class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if current_user.is_admin
      return '/users'
    end
    return root_path
  end
  protected
  def configure_permitted_parameters
    # sign_upのときに、name, ageを許可する
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :age, :nickname, :gender, :game_id, :avatar]
    
    # account_updateのときに、name,ageを許可する
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :age, :nickname, :gender, :game_id, :avatar]
  end
end
