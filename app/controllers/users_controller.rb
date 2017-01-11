class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    @favorite_houses =  @user.favorite_houses
  end
  
  private
  
    def set_user
      @user = User.find(current_user.id)
    end

end