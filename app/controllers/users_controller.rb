class UsersController < ApplicationController

before_action :authenticate_user!
before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}

  def show
     @user = User.find(params[:id])
     @post_pages = @user.books
     @book = Book.new
  end

  def edit
     @user = User.find(params[:id])
     if @user != current_user
      redirect_to books_path
    end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
      flash[:success] = "User info was successfully updated."
      redirect_to user_path(@user.id)
      else
        flash[:success] = "Error in update the user"
        render :edit
      end
  end

  def index
     @book = Book.new
     @users = User.all
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:success] = "権限がありません"
      redirect_to books_path
    end
  end
end
