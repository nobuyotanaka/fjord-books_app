# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters_signup, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
 #新規登録が可能なパラメータ
 def configure_permitted_parameters_signup
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zipcode, :address, :introduction])
end


  #編集が可能なパラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :zipcode, :address, :introduction])
  end
end
