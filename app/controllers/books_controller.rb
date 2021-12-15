class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = current_user
  end
  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'successfully update!'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]= 'successfully createbook!'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
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
   def book_params
    params.require(:book).permit(:title, :body)
   end
end
