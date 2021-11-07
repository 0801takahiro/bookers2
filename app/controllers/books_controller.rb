class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to books_path
    else
     render :index
    end
  end

  def index
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     if  @book.update(book_params)
         flash[:thumb] = 'successfully'
         redirect_to book_path
     else render :edit
     end
  end

  def destroy
  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
