class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def index
    @currentUser = User.find(current_user.id)
    @newBook = Book.new
    @users = User.all
  end

  #userの詳細
  def show
    @user = User.find(params[:id])
    @userBooks = Book.where(user_id: params[:id])
    @new_book = Book.new
  end

  #Userの編集
  def edit
    @user = User.find(params[:id])
  end

  #Userの変更更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "is too short (minimum is 2 characters)"
      render :edit
    end
  end

  private

    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end

    def set_user
      @user = User.find([:id])
    end

    def user_params
      params.require(:user).permit(:name,:introduction, :profile_image)
    end
end
