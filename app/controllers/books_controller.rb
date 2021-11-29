class BooksController < ApplicationController
  def new
     @books = Books.new
  end

  def create
    @book = Book.new(books_params)
    @books.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(books_params)
    if @book.save
     flash[:notice]= 'successfully createbook!'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     flash[:success] = 'successfully destroy!'
    redirect_to books_path 
  end
  
  private
   def books_params
    params.require(:book).permit(:title, :body)
   end
end
