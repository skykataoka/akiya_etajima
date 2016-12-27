class FavoritesController < ApplicationController
  def create
    @house = House.find(params[:house_id])
    @favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])
    respond_to do |format|
      if @favorite.save
        @house.reload
        format.js
      else
        format.html { redirect_to house_path(@house) }
      end
    end
  end

  def destroy
    @house = House.find(params[:house_id])
    @favorite = Favorite.find_by(user_id: current_user.id, house_id: params[:house_id])
    respond_to do |format|
      if @favorite.destroy
        @house.reload
        format.js
      else
        format.html { redirect_to house_path(@house) }
      end
    end
  end
end

