class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    redirect_to user_path
  end
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  def edit
   @user = User.find(params[:id])
   if @user == current_user
     render :edit
   else 
     redirect_to user_path(current_user)
   end
  end
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end