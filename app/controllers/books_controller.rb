class BooksController < ApplicationController

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @user = User.find_by(id: current_user)
    @users = User.all
    @new_book.user_id = current_user.id
    if @new_book.save
     flash[:finger] = 'successfully'
     redirect_to book_path(@new_book)
    else
     render :index
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
    @user = User.find_by(id: current_user)
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
     if @book.user != current_user
      redirect_to  books_path
     else
      if
         @book.update(book_params)
         flash[:thumb] = 'successfully'
         redirect_to book_path(@book)
      else
       render :edit
      end
     end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  books_path
    else
      @book.destroy
      redirect_to books_path
    end
  end

 private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
