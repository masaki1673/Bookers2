class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @
  end
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @User.save
    redirect_to user_path
  end
  def edit
    @user = User.find(params[:id])
    @user = User.new
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduce)
  end
end
