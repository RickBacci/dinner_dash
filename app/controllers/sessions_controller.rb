class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Could not create session!'
      redirect_to new_user_path
    end
  end

  def destroy
    session.destroy
    current_user = nil
    redirect_to root_path
  end
end
