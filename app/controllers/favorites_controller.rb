class FavoritesController < ApplicationController
  def create
    @house = House.find(params[:house_id])
    @favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])
    respond_to do |format|
      binding.pry
      if @favorite.save
        format.js
      else
        format.html { redirect_to house_path(@house) }
      end
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, house_id: params[:house_id])
    respond_to do |format|
      binding.pry
      if @favorite.destroy
        format.js
      else
        format.html { redirect_to house_path(@house) }
      end
    end
  end
end

