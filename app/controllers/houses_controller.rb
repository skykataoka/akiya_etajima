class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @houses = House.all.order('id')
  end

  def show
    @house = House.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, house_id: params[:id])
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
