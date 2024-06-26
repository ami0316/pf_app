class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
end
