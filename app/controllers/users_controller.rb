class UsersController < ApplicationController

  def show
     @users = User.all
     @user = User.find(params[:id])
     @books = @user.books.page(params[:page])
     @new_book = Book.new
  end

  def index
    @users = User.all
    @books = Book.all
    @new_book = Book.new
    @user = User.find_by(id: current_user)
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
     flash[:finger] = 'successfully'
     redirect_to book_path(@new_book)
    else
     render :"book/index"
    end
    @user = User.new(user_params)
    @book.user_id = current_user.id
    @user.save
    redirect_to books_path
  end

  def edit
     @user = User.find(params[:id])
     unless @user == current_user
       redirect_to user_path(current_user)
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:thumb] = 'successfully'
       redirect_to user_path(@user.id)
    else
       render :edit
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
