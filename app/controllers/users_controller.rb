class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
  end

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
