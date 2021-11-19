class UsersController < ApplicationController


  def show
     @user = User.find(params[:id])
     @books = @user.books.page(params[:page])
  end

  def index
    @users = User.all
    @books = Book.all
    @user = User.find_by(id: current_user)
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:finger] = 'successfully'
     redirect_to books_path
    else
     render :"book/index"
    end
  end

  def edit
     @user = User.find(params[:id])
     unless @user == current_user
       redirect_to books_path
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
    params.require(:user).permit(:name, :introduction, :image)
  end

end
