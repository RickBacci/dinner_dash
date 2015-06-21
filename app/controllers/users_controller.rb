class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Could not create user!'
      render :new
    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @user_orders = @user.orders
    else
      render file: "/public/404" unless users_page?
    end
  end

  private

  def user_params
    params.require(:user).permit([:name, :email_address, :username, :password, :role])
  end
end
