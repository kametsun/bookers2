class UserController < ApplicationController
  def show
  end
  
  private
    
    def set_user
      @user = User.find([:id])
    end
end
