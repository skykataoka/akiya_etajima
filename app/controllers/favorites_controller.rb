class FavoritesController < ApplicationController
  def create
    @house = House.find(params[:house_id])
    @favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])
    @favorite.save
    redirect_to house_path(params[:house_id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, house_id: params[:house_id])
    @favorite.destroy
    redirect_to house_path(params[:id])
  end
end

