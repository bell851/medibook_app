# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'admin'
  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    admins_path
  end
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
