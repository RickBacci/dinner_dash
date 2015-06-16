class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      # save unsuccessful
    end
  end

  def show
    @user = User.find(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
