class CategoriesController < ApplicationController
  def index
<<<<<<< HEAD
    @user = User.find(session[:user_id]) if session[:user_id]
=======
    @categories = Category.all
>>>>>>> 60bb67578be37cd6c87ceeb1030971c931962548
  end
end
