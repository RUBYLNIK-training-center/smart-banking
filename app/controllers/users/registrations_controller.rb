# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create

  def update
    if current_user.update(user_params)
      redirect_to users_url, notice: 'Your account was successfully updated.'
    else
      redirect_to request.referer, notice: current_user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :age, :email, :avatar, :phone_number, :passport_number, :password,
                                 :password_confirmation)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname age])
  end
end
