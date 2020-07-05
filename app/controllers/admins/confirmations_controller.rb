# frozen_string_literal: true

class Admins::ConfirmationsController < Devise::ConfirmationsController
  before_action :authenticate_admin!
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    super if resource.nil? || resource.confirmed?
  end
  
  def confirm
    confirmation_token = params[resource_name][:confirmation_token]
    self.resource = resource_class.find_by_confirmation_token!(confirmation_token)
  
    if resource.update(confirmation_params)
      self.resource = resource_class.confirm_by_token(confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect  resource
    else
      render :show
    end
  end
  

  protected

  def confirmation_params
    params.require(resource_name).permit(:name, :password)
  end

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    edit_admin_registration_path(resource_name)
  end

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

end
