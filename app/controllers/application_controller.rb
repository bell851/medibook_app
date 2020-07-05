class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    #管理者がログインしているか？
    def logged_in_admin
      unless admin_signed_in?
        flash[:denger] = 'ログインしてください'
        redirect_to new_admin_session_path
      end
    end
end
