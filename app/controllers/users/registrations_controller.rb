# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /users/sign_up

    # POST /users

    # GET /users/edit

    # PUT /users
    def update
      @user = User.find_by(email: params[:user][:email])
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /users

    # GET /users/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
    end

    # The path used after sign up.

    # The path used after sign up for inactive accounts.

    private

    def user_params
      params.require(:user).permit(:name, :avatar)
    end
  end
end
