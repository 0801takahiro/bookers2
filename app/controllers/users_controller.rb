class UsersController < ApplicationController
  def show
     @books = Book.all
     @user = User.find(params[:id])
     @book = Book.find(params[:id])
     @books = Book.page(params[:page]).reverse_order
  end

  def index
    @users = User.all
    @user = User.new
    @books = Book.all
  end



  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
