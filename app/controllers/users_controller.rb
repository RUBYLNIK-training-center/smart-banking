class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit; end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your account was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :surname, :age, :email, :avatar, :phone_number, :passport_number,
                                 :password)
  end
end
