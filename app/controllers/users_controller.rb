class UsersController < ApplicationController
  include WalletsHelpers

  def show
    @user = user
    @wallets = WalletsHelpers.unlocked_user_wallets(@user)
    @currencies = Currency.order(:name)
    @wallet = Wallet.new
  end

  def edit
    @user = user
  end

  def update
    @user = user
      if @user.update(user_params)
        redirect_to @user, notice: 'Your account was successfully updated.'
      else
        redirect_to request.referer, notice: @user.errors.full_messages
      end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :age, :email, :avatar, :phone_number, :passport_number, :password,
                                 :password_confirmation)
  end
end
