class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  load_and_authorize_resource only: [:index]
  
  def index
    @users = User.all
  end
  
  def show
    @favorite_houses =  @user.favorite_houses
    unless current_user.status_admin?
      show_page if current_user.id != @user.id
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end

end