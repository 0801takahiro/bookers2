class BooksController < ApplicationController


  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:finger] = 'successfully'
     redirect_to books_path
    else
     render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find_by(id: current_user)
  end

  def show
    @book = Book.find(params[:id])
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
         redirect_to book_path
      else
       render :edit
      end
     end
  end

  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  books_path
    else
      @book.destroy
    end
  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
