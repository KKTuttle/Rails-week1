class UsersController < ApplicationController


  def show
    @user = current_user
    render :profile
  end
end
