class UsersController < ApplicationController

  def index
    @currentUser = current_user
    @newBook = Book.new
    @users = User.all
  end

  #userの詳細
  def show
    @user = User.find(current_user.id)
    @userBooks = Book.where(user_id: current_user.id)
    @new_book = Book.new
  end

  #Userの編集
  def edit
    @user = User.find(params[:id])
  end

  #Userの変更更新
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

    def set_user
      @user = User.find([:id])
    end

    def user_params
      params.require(:user).permit(:name, :profile_image)
    end
end
