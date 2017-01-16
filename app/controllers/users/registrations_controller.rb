class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end
  
  def build_resource(hash=nil)
    new_hash = {}
    new_hash[:occupation] = params[:occupation]
    new_hash[:sex] = params[:sex]
    new_hash[:spouse] = params[:spouse]
    hash.merge!(new_hash)
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    new_hash = {}
    new_hash[:occupation] = params[:occupation]
    new_hash[:sex] = params[:sex]
    new_hash[:spouse] = params[:spouse]
    params[:user].merge!(new_hash)
    super
  end
  
  # def update_resource(resource, params)
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the users wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
