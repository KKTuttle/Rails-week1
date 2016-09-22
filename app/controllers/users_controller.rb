class UsersController < ApplicationController


  def show
    @user = current_user
    render :profile
  end

  def edit
    @user.update(image_params)
    # @user = current_user
  end

  def update
    @user = current_user
    @user.update(image_params)
    redirect_to user_path(@user)
  end

private
  def image_params
    params.require(:user).permit(:avatar)
  end
end
