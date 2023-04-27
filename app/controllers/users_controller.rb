class UsersController < ApplicationController

  def index
    @currentUser = current_user
    @newBook = Book.new
    @users = User.all
  end

  #userの詳細
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  #Userの編集
  def edit
  end

  #Userの変更更新
  def update
  end

  private

    def set_user
      @user = User.find([:id])
    end

    def user_params
      params.require(:user).permit(:name, :profile_image)
    end
end
