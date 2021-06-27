class UsersController < ApplicationController
  def show
    @user = user
    @currencies = Currency.order(:name)
  end

  def edit
    @user = user
  end

  def update
    @user = user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your account was successfully updated.' }
      else
        format.html { render :edit }
      end
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
