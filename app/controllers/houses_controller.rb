class HousesController < ApplicationController
  
  def index
    @houses = House.all.order('id')
    @hash = Gmaps4rails.build_markers(@houses) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow house.title
      marker.json({ link: house_path(house) })
    end
  end

  def show
    @house = House.find(params[:id])
    if current_user
      @favorite = Favorite.find_by(user_id: current_user.id, house_id: params[:id])
    end
    @pin = Gmaps4rails.build_markers(@house) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow house.address
    end
  end

  def new
  end

  def create
  end
end
